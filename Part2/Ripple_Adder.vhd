library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Ripple_Adder is
    port (Ain,Bin : in std_logic_vector(3 downto 0);
	       Cin     : in std_logic;
			 Sout    : out std_logic_vector(3 downto 0);
			 Cout    : out std_logic );
end entity Ripple_Adder ;

architecture design1 of Ripple_Adder is
  component Full_Adder is 
       port (A, B, Cin: in std_logic; 
               S, Cout: out std_logic);	
  end component Full_Adder ;

signal a,b,c,d,CB : std_logic ;
signal carryout : std_logic_vector(2 downto 0);

begin

opr1 : XOR_2 port map (Cin,Bin(0),a);
opr2 : XOR_2 port map (Cin,Bin(1),b);
opr3 : XOR_2 port map (Cin,Bin(2),c);
opr4 : XOR_2 port map (Cin,Bin(3),d);

opr5: Full_Adder port map(Ain(0),a,Cin,Sout(0),carryout(0));
opr6: Full_Adder port map(Ain(1),b,carryout(0),Sout(1),carryout(1));
opr7: Full_Adder port map(Ain(2),c,carryout(1),Sout(2),carryout(2));
opr8: Full_Adder port map(Ain(3),d,carryout(2),Sout(3),CB);
opr9: XOR_2      port map(Cin,CB,Cout) ;

end design1 ;
