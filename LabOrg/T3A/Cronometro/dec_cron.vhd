library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dec_cron is
	generic ( 
		CLOCK_FREQ : integer := 25000000
	);
    port ( 
	clock : IN std_logic;
	reset : IN std_logic;
	carga : IN std_logic;
	conta : IN std_logic;
	keys  : IN std_logic_vector(6 downto 0)
    );
end dec_cron;

architecture dec_cron of dec_cron is
   --SINAIS
	signal clk_seg : std_logic := '0';

	signal segundos_bcd : std_logic_vector(7 downto 0) := "00000000";
	signal minutos_bcd : std_logic_vector(7 downto 0) := "00000000";

	signal d1 : std_logic_vector(6 downto 0);
	signal d2 : std_logic_vector(6 downto 0);
	signal d3 : std_logic_vector(6 downto 0);
	signal d4 : std_logic_vector(6 downto 0);

type ROM is array (0 to 99) of std_logic_vector (7 downto 0);
constant Conv_to_BCD : ROM:=(
                "00000000", "00000001", "00000010", "00000011", "00000100", 
                "00000101", "00000110", "00000111", "00001000", "00001001",  
                "00010000", "00010001", "00010010", "00010011", "00010100", 
                "00010101", "00010110", "00010111", "00011000", "00011001",  
                "00100000", "00100001", "00100010", "00100011", "00100100", 
                "00100101", "00100110", "00100111", "00101000", "00101001",  
                "00110000", "00110001", "00110010", "00110011", "00110100", 
                "00110101", "00110110", "00110111", "00111000", "00111001",  
                "01000000", "01000001", "01000010", "01000011", "01000100", 
                "01000101", "01000110", "01000111", "01001000", "01001001",  
                "01010000", "01010001", "01010010", "01010011", "01010100", 
                "01010101", "01010110", "01010111", "01011000", "01011001",
                "01100000", "01100001", "01100010", "01100011", "01100100", 
                "01100101", "01100110", "01100111", "01101000", "01101001",
                "01110000", "01110001", "01110010", "01110011", "01110100", 
                "01110101", "01110110", "01110111", "01111000", "01111001",
                "10000000", "10000001", "10000010", "10000011", "10000100", 
                "10000101", "10000110", "10000111", "10001000", "10001001",
                "10010000", "10010001", "10010010", "10010011", "10010100", 
                "10010101", "10010110", "10010111", "10011000", "10011001"
);
    type states is (REP, LOAD, COUNT); 
    signal EA, PE : states;
    
begin

    -- P1:  divisor de clock para gerar o clk1seg
	divisor: process(clock, reset)
	begin
		-- dividir o clock em 1 segundo
	end process;

    -- P2/P3: máquina de estados para determinar o estado atual (EA)
	estados: process(clock, reset)
	begin
		-- maquina de estados parecida com a do T1B
	end process;
    -- P4: contador de segundos
	cont_segundos: process(clk_seg, reset)
	begin
		-- incrementar o segundo
	end process;
    -- P5: contador de minutos
	cont_minutos: process(clk_seg, reset)
	begin
		-- incrementar o minuto
	end process;
		-- instanciação das ROMs
		segundos_bcd <= conv_to_BCD(conv_integer(segundos));
		minutos_bcd  <= conv_to_BCD(conv_integer(minutos));

		-- display driver
		d1 <= '1' & segundos_bcd(3 downto 0) & '1';
		d2 <= '1' & segundos_bcd(7 downto 4) & '1';
		d3 <= '1' & minutos_bcd(3 downto 0) & '1';
		d4 <= '1' & minutos_bcd(7 downto 0) & '1';
		display_driver : entity work.dspl_drv
		port map (
		   -- mapear os "fios" de acordo com as entradas do projeto
		);
		
end dec_cron;
