library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity relogio_xadrez is
  generic ( CLOCK_FREQ : integer := 25000000 ); -- O generic é para parametrizar o divisor de clock
  port ( ... ); -- Pinos conforme o diagrama de blocos ou o arquivo UCF
end relogio_xadrez;

architecture relogio_xadrez of relogio_xadrez is
  -- DECLARAR OS SINAIS NESSÁRIOS
  type states is (REP, LOAD, COUNT_J1a, COUNT_J1, COUNT_J2a, COUNT_J2, END_J1, END_J2);
	signal EA, PE : states;

begin

	a1: entity work.edge_detector port map (clock=>clock, reset=>reset, din=> carga, rising=>carga_int);
	a2: entity work.edge_detector port map ( ... j1_int);
	a3: entity work.edge_detector port map ( ... j2_int);
	
	i_cron_j1: entity work.dec_cron -- cronometro p/ jogador 1
             generic map (CLOCK_FREQ => CLOCK_FREQ )
             port map ( ... );

  i_cron_j2: entity work.dec_cron -- cronometro p/ jogador 2
             generic map (CLOCK_FREQ => CLOCK_FREQ )
             port map ( ... );

	--------- DOIS PROCESSOS PARAA MÁQUINA DE ESTADOS -------------
	
	-- Sinais controlados pelo Estado Atual da máquina de estados - combinacional
	led_j2  <= '1' when EA=COUNT_J2 else'0';
	led_j1  <= '1' when ...;
	conta   <= '1' when ...;
	vez_j1  <= '0' ... else '1';
	vez_j2  <= '0' ... else '1';
	an      <= an_j1 ...;
	dec_ddp <= dec_ddp_j1 when ...;

end relogio_xadrez;
