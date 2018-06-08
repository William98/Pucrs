library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity relogio_xadrez is
  generic ( CLOCK_FREQ : integer := 50000000 ); -- Usado para parametrizar o divisor de clock
  port (
    clock : in std_logic;
    reset : in std_logic;
    carga : in std_logic;
    chaves : in std_logic_vector(6 downto 0);
    j1, j2 : in std_logic;
    led_j1, led_j2 : out std_logic;
    an  : out std_logic_vector(3 downto 0);
    dec_ddp : out std_logic_vector(7 downto 0)); -- Pinos conforme o diagrama de blocos ou o arquivo UCF
end relogio_xadrez;

architecture relogio_xadrez of relogio_xadrez is
  -- DECLARAR OS SINAIS NESSÁRIOS
  signal vez_j1, vez_j2, conta, fim_j1, fim_j2, carga_int, j1_int, j2_int : std_logic; -- sinais responsaveis por identificar o jogada de acordo com o jogador
  signal an_j1, an_j2 : std_logic_vector(3 downto 0); -- sinais reponsaveis por selecionar os ddp ativos durante a execucao
  signal dec_ddp_j1, dec_ddp_j2 : std_logic_vector(7 downto 0); -- sinais responsaveis pela exibicao no ddp de acordo com o jogador
  type states is (REP, LOAD, COUNT_J1a, COUNT_J1, COUNT_J2a, COUNT_J2, END_J1, END_J2);
  signal EA, PE : states;
  begin
    -- Detector do clock geral
    a1: entity work.edge_detector port map (clock=>clock, reset=>reset, din=> carga, rising=>carga_int);
    -- Detector edge Jogador 1
    a2: entity work.edge_detector port map (clock=>clock, reset=>reset, din=> j1, rising=>j1_int);
    -- Detector edge Jogador 2
    a3: entity work.edge_detector port map (clock=>clock, reset=>reset, din=> j2, rising=>j2_int);
    -- Cronometro Jogador 1
    i_cron_j1: entity work.dec_cron
    generic map (CLOCK_FREQ => CLOCK_FREQ)
    port map (clock=>clock, reset=>reset, ce=>vez_j1,carga=>carga,conta=>conta,chaves=>chaves,an=>an_j1,dec_ddp=>dec_ddp_j1,fim=>fim_j1);
    -- Cronometro Jogador 2
    i_cron_j2: entity work.dec_cron
    generic map (CLOCK_FREQ => CLOCK_FREQ )
    port map (clock=>clock, reset=>reset, ce=>vez_j2,carga=>carga,conta=>conta,chaves=>chaves,an=>an_j2,dec_ddp=>dec_ddp_j2,fim=>fim_j2);
    --------- DOIS PROCESSOS PARA A MÁQUINA DE ESTADOS -------------
    controle: process(clock, reset)
    begin
      if reset = '1' then
        EA <= REP;
      elsif clock'event and  clock = '1' then
        EA <= PE;
      end if;
    end process;

    combinacional: process(EA, carga_int, j1_int, j2_int, fim_j1, fim_j2, an_j1, an_j2, dec_ddp_j1, dec_ddp_j2)
    begin
        if EA = REP then
            led_j1 <= '0';
            led_j2 <= '0';
            vez_j1 <= '0';
            vez_j2 <= '0';
            an <= an_j1;
            an <= an_j2;
            conta <= '0';
            dec_ddp <= dec_ddp_j1;
            dec_ddp <= dec_ddp_j2;
            if carga_int = '1' then
              PE <= LOAD;
            else
              PE <= EA;
            end if;
        elsif EA = LOAD then
            led_j1 <= '0';
            led_j2 <= '0';
            vez_j1 <= '1';
            vez_j2 <= '1';
            an <= an_j1;
            an <= an_j2;
            conta <= '0';
            dec_ddp <= dec_ddp_j1;
            dec_ddp <= dec_ddp_j2;
            if j1_int = '1' then
              PE <= COUNT_J1a;
            elsif j2_int = '1' then
              PE <= COUNT_J2a;
            else
              PE <= EA;
            end if;
        elsif EA = COUNT_J1a then
            led_j1 <= '0';
            led_j2 <= '0';
            vez_j1 <= '1';
            vez_j2 <= '0';
            conta <= '0';
            an <= an_j1;
            dec_ddp <= dec_ddp_j1;
            if j1_int = '0' then
              PE <= COUNT_J1;
            else
              PE <= EA;
            end if;
        elsif EA = COUNT_J2a then
            led_j1 <= '0';
            led_j2 <= '0';
            vez_j1 <= '0';
            vez_j2 <= '1';
            conta <= '0';
            an <= an_j2;
            dec_ddp <= dec_ddp_j2;
            if j2_int = '0' then
              PE <= COUNT_J2;
            else
              PE <= EA;
            end if;
        elsif EA = COUNT_J1 then
            led_j1 <= '1';
            led_j2 <= '0';
            vez_j1 <= '1';
            vez_j2 <= '0';
            conta <= '1';
            an <= an_j1;
            dec_ddp <= dec_ddp_j1;
            if j1_int = '1' then
              PE <= COUNT_J2;
            elsif fim_j1 = '1' then
              PE <= END_J1;
              conta <= '0';
            else
              PE <= EA;
            end if;
      elsif EA = COUNT_J2 then
            led_j1 <= '0';
            led_j2 <= '1';
            vez_j1 <= '0';
            vez_j2 <= '1';
            conta <= '1';
            an <= an_j2;
            dec_ddp <= dec_ddp_j2;
            if j2_int = '1' then
              PE <= COUNT_J1;
            elsif fim_j2 = '1' then
              PE <= END_J2;
              conta <= '0';
            else
              PE <= EA;
            end if;
        elsif EA = END_J1 then
            led_j1 <= '1';
            led_j2 <= '0';
            vez_j1 <= '1';
            vez_j2 <= '0';
            conta <= '0';
            an <= "1110";
            dec_ddp <= "00100101";
            PE <= EA;
        elsif EA = END_j2 then
            led_j1 <= '0';
            led_j2 <= '1';
            vez_j1 <= '0';
            vez_j2 <= '1';
            conta <= '0';
            an <= "1110";
            dec_ddp <= "10011111";
            PE <= EA;
        end if;
    end process;
    -- Sinais controlados pelo Estado Atual da máquina de estados – combinacional
    led_j2 <= '1' when EA=COUNT_J2 else'0';
    led_j1 <= '1' when ...;
    conta <= '1' when ...;
    vez_j1 <= '0' ... else '1';
    vez_j2 <= '0' ... else '1';
    an <= an_j1 ...;
    dec_ddp <= dec_ddp_j1 when ...;

end relogio_xadrez;
