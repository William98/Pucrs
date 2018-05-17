--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Implementacao em hardware sintetizavel de uma organizacao monociclo
--	do processador MIPS. Apenas 11 das instrucoes do MIPS sao aceitas
--	por esta organizacao:
--	ADDU, SUBU, AAND, OOR, XXOR, NNOR, LW, SW, ORI, LUI e BEQ
--
--	Versao 	Inicial - Ney 05/agosto/2016 (MIPS_V0)
--	Revisao - Ney 02/junho/2017 - Acréscimo de LUI e BEQ como instruções
--		executáveis, adaptando o hardware de acordo.
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- package com tipos basicos
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.Std_Logic_1164.all;

package p_MIPS_V0 is  
  
  subtype wires32 is std_logic_vector(31 downto 0);  
  -- tipo para os barramentos de 32 bits
  
  type inst_type is (ADDU, SUBU, AAND, OOR, XXOR, NNOR, LW, SW, 
  	ORI, LUI, BEQ, invalid_instruction);

  type microinstruction is record
    ce:    std_logic;		-- ce e rw sao os controles da memoria
    rw:    std_logic;
    i:     inst_type;        
    wreg:  std_logic; 		-- wreg diz se o banco de registradores
				-- deve ou nao ser escrito
  end record;
    
end p_MIPS_V0;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Registrador generico sensivel ah borda de subida do clock
-- com possibilidade de inicializacao de valor
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;
use work.p_MIPS_V0.all;

entity reg is
           generic( INIT_VALUE : wires32 := (others=>'0') );
           port(  ck, rst, ce : in std_logic;
                  D : in  wires32;
                  Q : out wires32
               );
end reg;

architecture reg of reg is 
begin

  process(ck, rst)
  begin
       if rst = '1' then
              Q <= INIT_VALUE(31 downto 0);
       elsif ck'event and ck = '1' then
           if ce = '1' then
              Q <= D; 
           end if;
       end if;
  end process;
        
end reg;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Banco de Registradores  (R0..R31) - 31 registradores de 32 bits
-- 	Trata-se de uma memória com três portas de acesso, não confundir
--		com a memória principal do processador. 
--		São duas portas de leitura (sinais AdRP1+DataRP1 e AdRP2+DataRP2) e
--		uma porta de escrita (definida pelo conjunto de sinais 
--    ck, rst, ce, AdWP e DataWP).
--		Os endereços de cada porta (AdRP1, AdRP2 e AdWP) são obviamente de
--		5 bits (pois 2^5=32), enquanto que os barramentos de dados de 
--		saída (DataRP1, DataRP2) e de entrada (DataWP) são de 32 bits.
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.Std_Logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;   
use work.p_MIPS_V0.all;

entity reg_bank is
       port( ck, rst, ce :    in std_logic;
             AdRP1, AdRP2, AdWP : in std_logic_vector(4 downto 0);
             DataWP : in wires32;
             DataRP1, DataRP2: out wires32 
           );
end reg_bank;

architecture reg_bank of reg_bank is
   type wirebank is array(0 to 31) of wires32;
   signal reg : wirebank ;                            
   signal wen : wires32;
begin            

    g1: for i in 0 to 31 generate        

        -- Remember register $0 is the constant 0, not a register.
        -- This is implemented by never enabling writes to register $0
        wen(i) <= '1' when i/=0 and AdWP=i and ce='1' else '0';
         
        -- Remember register $29, the stack pointer, points to some place
        -- near the bottom of the data memory, not the usual place 
		-- assigned by the MIPS simulator!!
        g2: if i=29 generate -- SP ---  x10010000 + x800 -- top of stack
           r29: entity work.reg generic map(INIT_VALUE=>x"10010800")    
                port map(ck=>ck, rst=>rst, ce=>wen(i), D=>DataWP, Q=>reg(i));
        end generate;  
                
        g3: if i/=29 generate 
           rx: entity work.reg 
					port map(ck=>ck, rst=>rst, ce=>wen(i), D=>DataWP, Q=>reg(i));                    
        end generate;
                   
   end generate g1;   
    

    DataRP1 <= reg(CONV_INTEGER(AdRP1));    -- source1 selection 

    DataRP2 <= reg(CONV_INTEGER(AdRP2));    -- source2 selection 
   
end reg_bank;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ALU - a operacao depende somente da instrucao corrente que 
-- 	eh decodificada na Unidade de Controle
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.p_MIPS_V0.all;

entity alu is
       port( op1, op2 : in  wires32;
	outalu	: out wires32; 
	zero	: out std_logic;
	op_alu	: in  inst_type   
           );
end alu;

architecture alu of alu is 
signal int_alu	: wires32;
begin
    outalu <= int_alu;
    int_alu <=  
        op1 - op2      when  op_alu=SUBU or op_alu=BEQ			else
        op1 and op2    when  op_alu=AAND				else 
        op1 or  op2    when  op_alu=OOR  or op_alu=ORI	else 
        op1 xor op2    when  op_alu=XXOR              	else 
        op1 nor op2    when  op_alu=NNOR             	else 
        op2 (15 downto 0) & x"0000"	when op_alu=LUI else
        op1 + op2;      --- default eh a soma
	zero <= '1' when int_alu=x"00000000" else '0';
end alu;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Descricao do Bloco de Dados (Datapath)
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.Std_Logic_1164.all;
use work.p_MIPS_V0.all;
   
entity datapath is
      port(ck, rst : in std_logic;
      	  instruction : in wires32;
           d_address : out wires32;
           data : inout wires32;  
           uins : in microinstruction;
           zero : out std_logic
          );
end datapath;

architecture datapath of datapath is
   signal result, R1, R2, ext32, op2, reg_dest: wires32;
   signal adD   : std_logic_vector(4 downto 0) ;       
   signal instR : std_logic ;       
begin           
        
--==== sinal auxiliar para identificar instrução  com formato R ==

   instR <= '1' when uins.i=ADDU or uins.i=SUBU or 
	uins.i=AAND or uins.i=OOR or uins.i=XXOR or uins.i=NNOR else
        '0';

--==== hardware do banco de registradores e extensao de sinal ou de 0 ==
   adD <= instruction(15 downto 11) when instR='1'  else
          instruction(20 downto 16) ;            
                         
   REGS: entity work.reg_bank port map
	   (ck=>ck, rst=>rst, ce=>uins.wreg, AdRP1=>instruction(25 downto 21),
	   AdRP2=>instruction(20 downto 16), AdWP=>adD, 
	   DataWP=>reg_dest, DataRP1=>R1, DataRP2=>R2);
	   
   -- Extensao de 0 ou extensao de signal
   ext32 <= x"FFFF" & instruction(15 downto 0) when (instruction(15)='1' 
   and (uins.i=LW or uins.i=SW)) else
   		-- LW e SW usam extensao de sinal, ORI usa extensao de 0
			x"0000" & instruction(15 downto 0);
	   	-- outras instrucoes nao usam esta informacao,
			-- logo, qualquer coisa serve, extensao de 0 ou de sinal
			
--=========  hardware da ALU e em volta dela ==========================================
   op2 <= R2 when (instR='1' or uins.i=BEQ) else ext32; 
                 
   inst_alu: entity work.alu port map (op1=>R1, op2=>op2,
	   outalu=>result, zero=>zero, op_alu=>uins.i);
                                               
-- operacao com a memoria de dados    
   d_address <= result;
       
   data <= R2 when uins.ce='1' and uins.rw='0' else (others=>'Z');  
 
   reg_dest <=  data when uins.i=LW else result;

end datapath;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  Unidade de Controle - decodifica a instrucao e gera os sinais de controle
--		nesta implementacao  um bloco puramente combinacional
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_signed.all; 
use work.p_MIPS_V0.all;

entity control_unit is
	port(
	ck, rst : in std_logic;
	uins : out microinstruction;
   i_address : out wires32;
   instruction : in wires32;
   zero	: in std_logic
   );
end control_unit;
                   
architecture control_unit of control_unit is
  signal incpc, entpc, novoend, extsinoff, pc : wires32;
  signal i : inst_type;
begin

--======  Hardware para a busca de instrucoes  ======================

   rpc: entity work.reg 
   generic map(INIT_VALUE=>x"00400000")	-- ATENCAO a este VALOR!! 
    	   		-- Ele depende do simulador!!
    	   		-- Para o SPIM --> 	use x"00400020"
    			-- Para o MARS -->	use x"00400000"
   port map(ck=>ck, rst=>rst, ce=>'1', D=>entpc, Q=>pc);
   
   extsinoff <= x"fff" & "11" & instruction (15 downto 0) & "00" when instruction(15)='1' else
   		x"000" & "00" & instruction (15 downto 0) & "00";
   
   novoend <=  incpc + extsinoff;
   
   entpc <= novoend when (i=BEQ and zero='1') else incpc;
   
   incpc <= pc + 4;
   
   i_address <= pc;
   
--======  Hardware de decodificação de instrucoes  ======================

    uins.i <= i;
    
    i <= ADDU   when instruction(31 downto 26)="000000" and instruction(10 downto 0)="00000100001" else
         SUBU   when instruction(31 downto 26)="000000" and instruction(10 downto 0)="00000100011" else
         AAND   when instruction(31 downto 26)="000000" and instruction(10 downto 0)="00000100100" else
         OOR    when instruction(31 downto 26)="000000" and instruction(10 downto 0)="00000100101" else
         XXOR   when instruction(31 downto 26)="000000" and instruction(10 downto 0)="00000100110" else
         NNOR   when instruction(31 downto 26)="000000" and instruction(10 downto 0)="00000100111" else
         ORI    when instruction(31 downto 26)="001101" else
         LW     when instruction(31 downto 26)="100011" else
         SW     when instruction(31 downto 26)="101011" else
         LUI    when instruction(31 downto 21)="00111100000" else
         BEQ    when instruction(31 downto 26)="000100" else
         invalid_instruction ;	-- IMPORTANTE: condicao "default" eh invalid instruction;
        
    assert i /= invalid_instruction
          report "******************* INVALID INSTRUCTION *************"
          severity error;
                   
 --======  Geração de sinais de controle para o bloco de dados  ======================
 --======  e para a memória externa                             ======================

   uins.ce    <= '1' when i=SW  or i=LW else '0';
    
   uins.rw    <= '0' when i=SW  else '1';

   uins.wreg  <= '0' when (i=SW or i=BEQ) else '1';
    
end control_unit;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Topo da Hierarquia do Processador - instanciacao dos Blocos de 
-- 		Dados e de Controle
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.Std_Logic_1164.all;
use work.p_MIPS_V0.all;

entity MIPS_V0 is
    port( clock, reset: in std_logic;
          ce, rw : out std_logic;
          i_address: out wires32;
          instruction: in wires32;
          d_address : out  wires32;
          data: inout wires32
			 );
end MIPS_V0;

architecture MIPS_V0 of MIPS_V0 is
      signal uins: microinstruction;
      signal zero: std_logic;
 begin

     dp: entity work.datapath   
         port map(ck=>clock, rst=>reset, instruction=>instruction,
         	uins=>uins, d_address=>d_address, data=>data, zero=>zero);

     ct: entity work.control_unit 
     port map(ck=>clock, rst=>reset, uins=>uins, 
     i_address=>i_address, instruction=>instruction, zero=>zero);
         
     ce <= uins.ce;
     rw <= uins.rw;
     
end MIPS_V0;