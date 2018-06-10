-------------------------------------------------------------------------------
-- MODULO DETECTOR DE BORDA 
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
library work;

entity edge_detector is
        port(   clock           : in    std_logic;
                reset           : in    std_logic;
                din             : in    std_logic;              -- Input data
                rising          : out   std_logic               -- Edge detected
        );
end edge_detector;

architecture edge_detector of edge_detector is
        signal contador: std_logic_vector (16 downto 0);
        type states is (REP, ATIVA, WAITC); 
        signal EA : states;
begin
        
 process (clock,reset)
   begin
          if reset='1' then 
                 EA <= REP;
                 rising <= '0';
                 contador <= (others=>'0'); 
          elsif clock'event and clock='1' then
            case EA is
               when REP =>    if din='1' then   
                                   contador <= (others=>'0'); 
                                   EA<=ATIVA;
                                   rising <= '1';       
                              end if;

               when ATIVA =>  EA <= WAITC; 
                              rising <= '0';                     

               when WAITC =>  if din='0' and contador > 130000 then   ---   tempo de 2,6 ms para filtrar ruido
                                     EA<=REP;     
                              else
                                     contador <= contador + 1;
                              end if;
            end case;
          end if;       
   end process;

end edge_detector;