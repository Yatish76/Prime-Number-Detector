library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity LogicCkt is 
   port(Ain,Bin : in std_logic_vector(3 downto 0);
	     I8,I7   : out std_logic;
        Iout    : out std_logic_vector(4 downto 0));
end entity LogicCkt ;

architecture design0 of LogicCkt is 

component PrimeCheck is
    	port( Ain  : in std_logic_vector(3 downto 0);
        Bout  : out std_logic);
end component PrimeCheck ;
	
component Ripple_Adder is
   port (Ain,Bin : in std_logic_vector(3 downto 0); 
	       Cin     : in std_logic;
			 Sout    : out std_logic_vector(3 downto 0);
			 Cout    : out std_logic );
end component Ripple_Adder ;

signal a,b,c,d : std_logic;
signal Iout_temp : std_logic_vector(4 downto 0);


begin	

inst1 : PrimeCheck port map (Ain,a) ;
inst2 : PrimeCheck port map (Bin,b) ;
inst3 : OR_2       port map (a,b,c);
inst4 : XNOR_2 	 port map (a,b,d) ;
inst5 : Ripple_Adder port map (Ain,Bin,d,Iout_temp(3 downto 0),Iout_temp(4));
inst6 : AND_2 port map(Iout_temp(0),c,Iout(0));
inst7 : AND_2 port map(Iout_temp(1),c,Iout(1));
inst8 : AND_2 port map(Iout_temp(2),c,Iout(2));
inst9 : AND_2 port map(Iout_temp(3),c,Iout(3));
inst10 : AND_2 port map(Iout_temp(4),c,Iout(4));
 I8 <= a;
 I7 <= b;
 
 end design0 ;
 


				 