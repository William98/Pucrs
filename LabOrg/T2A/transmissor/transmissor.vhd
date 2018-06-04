library IEEE;
use IEEE.std_logic_1164.all;

entity transmissor is
port (clock,reset,send: in STD_LOGIC;
	palavra: in STD_LOGIC_VECTOR (7 downto 0);
	busy, linha: out STD_LOGIC
);
end transmissor;

architecture transmissor_arc of transmissor is
	type STATES is (REP, S0, S1, S2, S3, S4, S5, S6, S7, S8, S9);
	signal EA, PE : STATES;
	signal ocupado : std_logic;
begin
	controle: process(reset,clock)
	begin
		if reset='1' then 
			EA <= REP;
		elsif clock'event and clock='1' then
			EA <= PE;
		end if;
	end process;
	
	combinacional: process(EA, send)
	begin
		case EA is
			when REP =>
				if send='1' then PE<=S0; else EA<=REP; end if;
				ocupado <= '0';
				linha <= '1';
			when S0 => PE<=S1; ocupado <= '1'; linha <= '0';
			when S1 => PE<=S2; ocupado <= '1'; linha <= palavra(7);
			when S2 => PE<=S3; ocupado <= '1'; linha <= palavra(6);
			when S3 => PE<=S4; ocupado <= '1'; linha <= palavra(5);
			when S4 => PE<=S5; ocupado <= '1'; linha <= palavra(4);
			when S5 => PE<=S6; ocupado <= '1'; linha <= palavra(3);
			when S6 => PE<=S7; ocupado <= '1'; linha <= palavra(2);
			when S7 => PE<=S8; ocupado <= '1'; linha <= palavra(1);
			when S8 => PE<=S9; ocupado <= '1'; linha <= palavra(0);
			when S9 => PE<=REP; ocupado <= '1'; linha <= '0';
		end case;
	end process;
	
	busy <= ocupado;
end transmissor_arc;
