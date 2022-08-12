library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity PrimeCheck is
  port( Ain  : in std_logic_vector(3 downto 0);
        Bout  : out std_logic );
end entity PrimeCheck ; 

architecture checker of PrimeCheck is

Signal a,b,c,sop1,sop2,sop3,sop4 : std_logic ;

begin
 
stp1 : INVERTER port map(Ain(3),a);
stp2 : INVERTER port map(Ain(2),b);
stp3 : INVERTER port map(Ain(1),c);
stp4 : AND_3 port map(a,b,Ain(1),sop1);
stp5 : AND_3 port map(b,Ain(1),Ain(0),sop2);
stp6 : AND_3 port map(a,Ain(2),Ain(0),sop3);
stp7 : AND_3 port map(Ain(2),c,Ain(0),sop4);
stp8 : OR_4  port map(sop1,sop2,sop3,sop4,Bout);

end checker;
  
  
  