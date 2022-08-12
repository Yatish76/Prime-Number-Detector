-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(6 downto 0));
end entity;

architecture DutWrap of DUT is
   component LogicCkt is
    port(Ain,Bin : in std_logic_vector(3 downto 0);
	     I8,I7   : out std_logic;
        Iout    : out std_logic_vector(4 downto 0));
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: LogicCkt 
			port map (
					-- order of inputs Cin B A
					Ain   => input_vector(7 downto 4),
                                        -- order of outputs S Cout
					Bin => input_vector(3 downto 0 ),
				   I8 => output_vector(6) ,
				   I7 => output_vector(5),
				   Iout => output_vector(4 downto 0)	);

end DutWrap;

