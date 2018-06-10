
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity relogio_xadrez is
generic (CLOCK_FREQ : integer := 50000000);
port (clock, reset, carga, j1, j2 : in  std_logic;
	chaves : in  std_logic_vector (6 downto 0);
	an: out std_logic_vector (3 downto 0);
	dec_ddp: out std_logic_vector (7 downto 0);
	led_j1, led_j2: out std_logic);

end relogio_xadrez;

architecture relogio_xadrez of relogio_xadrez is
signal vez_j1,vez_j2,conta,fim_j1,fim_j2,carga_int,j1_int,j2_int: std_logic;
signal an_j1,an_j2: std_logic_vector (3 downto 0);
signal dec_ddp_j1,dec_ddp_j2: std_logic_vector (7 downto 0);

type states is (REP, LOAD, COUNT_J1a, COUNT_J1, COUNT_J2a, COUNT_J2, END_J1, END_J2);
signal EA, PE : states;

begin

a1: entity work.edge_detector port map (clock=>clock, reset=>reset, din=> carga, rising=>carga_int);
a2: entity work.edge_detector port map (clock=>clock, reset=>reset, din=> j1, rising=>j1_int);
a3: entity work.edge_detector port map (clock=>clock, reset=>reset, din=> j2, rising=>j2_int);

i_cron_j1: entity work.dec_cron -- cronometro p/ jogador 1
generic map (CLOCK_FREQ => CLOCK_FREQ ) port map (clock=>clock, reset=>reset, ce=>vez_j1,carga=>carga,conta=>conta,chaves=>chaves,an=>an_j1,dec_ddp=>dec_ddp_j1,fim=>fim_j1);
i_cron_j2: entity work.dec_cron -- cronometro p/ jogador 2
generic map (CLOCK_FREQ => CLOCK_FREQ ) port map (clock=>clock, reset=>reset, ce=>vez_j2,carga=>carga,conta=>conta,chaves=>chaves,an=>an_j2,dec_ddp=>dec_ddp_j2,fim=>fim_j2);

controle: process(clock, reset)
begin
	if reset='1' then
		EA <= REP;
	elsif clock'event and clock='1' then
		EA <= PE;
	end if;
end process;

combinacional:process(EA,carga_int,j1_int,j2_int,fim_j1,fim_j2,an_j1,an_j2,dec_ddp_j1,dec_ddp_j2)
begin
	if EA = REP then
		led_j1 <= '0';
		led_j2 <= '0';
		vez_j1 <= '0';
		vez_j2 <= '0';
		an <= an_j1;
		an <= an_j2;
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
		an <= an_j1;
		dec_ddp <= dec_ddp_j1;
		if j1_int = '1' then
			PE <= COUNT_J2a;
		elsif fim_j1 = '1' then
			PE <= END_J1;
		else
			PE <= EA;
		end if;

	elsif EA = COUNT_J2 then
		led_j1 <= '0';
		led_j2 <= '1';
		vez_j1 <= '0';
		vez_j2 <= '1';
		an <= an_j2;
		dec_ddp <= dec_ddp_j2;
		if j2_int = '1' then
			PE <= COUNT_J1;
		elsif fim_j2 = '1' then
			PE <= END_J2;
		else
			PE <= EA;
		end if;

	elsif EA = END_J1 then
		led_j1 <= '1';
		led_j2 <= '0';
		vez_j1 <= '1';
		vez_j2 <= '0';
		an <= "1110";
		dec_ddp <= "00100101";
		PE <= EA;
	elsif EA = END_j2 then
		led_j1 <= '0';
		led_j2 <= '1';
		vez_j1 <= '0';
		vez_j2 <= '1';
		an <= "1110";
		dec_ddp <= "10011111";
		PE <= EA;
	end if;
end process;

	conta <= '1' when EA = COUNT_J1 or EA = COUNT_J2 or EA = COUNT_J1a or EA = COUNT_J2a
				else '0';
	
end relogio_xadrez;
