-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(3 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component PrimeCheck is
     port(Ain   : in std_logic_vector(3 downto 0);
          Bout  : out std_logic_vector(0 downto 0));
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: PrimeCheck 
			port map (
					-- order of inputs Cin B A
					Ain   => input_vector(3 downto 0),
                                        -- order of outputs S Cout
					Bout => output_vector(0 downto 0 ) );

end DutWrap;

