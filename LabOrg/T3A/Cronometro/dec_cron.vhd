library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dec_cron is
	generic (
		CLOCK_FREQ : integer := 50000000
	);
    	port (
		clock	: in std_logic;
		reset	: in std_logic;
		carga	: in std_logic;
		conta	: in std_logic;
		chaves	: in std_logic_vector(6 downto 0);
		an	: out std_logic_vector(3 downto 0);
		dec_ddp	: out std_logic_vector(7 downto 0)
    	);
end dec_cron;

architecture dec_cron of dec_cron is

   --SINAIS
   signal clk_seg  : std_logic := '0'; -- clock em 1 segundo
   signal contador : integer := 0; -- contador para dividir clock
	
	signal segundos_bcd, minutos_bcd : std_logic_vector(7 downto 0); -- sinais de minutos e segundos BCD
	signal segundos, minutos : std_logic_vector(7 downto 0); -- sinais de minutos e segundos
	signal d1, d2, d3, d4 : std_logic_vector(5 downto 0); -- sinais saida no display
	
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
	-- P1:  divisor de clock para gerar o clk_seg
	divisor: process(clock, reset)
	variable cont: integer range 0 to CLOCK_FREQ;
	begin
		if reset='1' then
			clk_seg <= '0';
		else if(clock'event and clock='1' and ce='1')then
			if(cont<CLOCK_FREQ)then
				cont:=cont+1;
				clk_seg <= not clk_seg;
			else				
				cont:=0;
			end if;
		end if;
		end if;
	end process;

	-- P2/P3: máquina de estados para determinar o estado atual (EA)
	-- Altera o estado atual de acordo com o que esta salvo proximo estado
	set_estados: process(clk_seg, reset)
	begin
		if reset = '1' then
			EA <= REP;
		else if clk_seg'event and clk_seg = '1' then 
			EA <= PE;
		end if;
		end if;
	end process;
	-- @TODO process apresenta erro
	update_estados: process(EA, conta, carga, segundos, minutos) -- inserir clock ou clk_seg?
	begin
		case EA is
			when REP => 
				if carga = '1' then
					PE <= LOAD;
					-- chip enable
				else
					PE <= EA;
					-- chip enable
				end if;
			when LOAD =>
				if conta = '1' then 
					PE <= COUNT;
					-- chip enable
				else
					PE <= EA;
					-- chip enable
				end if;
			when COUNT =>
				if segundos = "0000000" and minutos = "0000000" then
					PE <= REP;
					-- chip enable
				else
					PE <= EA;
					-- chip enable
				end if;
	end process;

	-- P4: contador de segundos
	-- Decrementa os segundos
	cont_segundo: process(clk_seg, reset)
	begin
		if reset='1' then
		segundos <= (others=>'0');
		elsif clk_seg'event and clk_seg='1' then
			if EA = REP then
				segundos <= (others=>'0');
			elsif EA = LOAD then
	   			segundos <= (others=>'0');
			elsif EA = COUNT and segundos > "00000000" then
				segundos <= segundos-1;
			else
				segundos <= "00111011";			
			end if;
		end if;
	end process;

	-- P5: contador de minutos
	cont_minuto: process(clock, reset)
	begin
		if reset='1' then
			minutos <= (others=>'0');
		elsif clk_seg'event and clk_seg='1' then
			if EA = REP then
				minutos <= (others=>'0');
			elsif EA = LOAD then
				minutos <= '0' & chaves;
			elsif EA = COUNT and segundos = "00000000" and minutos > "00000000" then
				minutos <= minutos-1;
			else
				minutos <= (others=>'0');
			end if;
		end if;
	end process;

	-- instanciação das ROMs
	segundos_bcd <= conv_to_BCD(conv_integer(segundos)); -- conversao de segundos (Binary coded Decimal)
	minutos_bcd  <= conv_to_BCD(conv_integer(minutos)); -- conversao de minutos (Binary coded Decimal)

	-- display driver
	d1 <= '1' & segundos_bcd(3 downto 0) & '1'; -- separacao da parte menos significativa
	d2 <= '1' & segundos_bcd(7 downto 4) & '1'; -- separacao da parte mais significativa
	d3 <= '1' & minutos_bcd(3 downto 0) & '1'; -- separacao da parte menos significativa
	d4 <= '1' & minutos_bcd(7 downto 4) & '1'; -- separacao da parte mais significativa
	-- mapeado sinais do driver do display
	display_driver : entity work.dspl_drv
	port map (clock=> clock, reset=> reset, d1=> d1, -- mapeado "fios do driver do display"
		d2=> d2, d3=> d3, d4=> d4);

end dec_cron;
