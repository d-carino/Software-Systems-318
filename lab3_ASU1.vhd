LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY lab3_ASU1 IS
    PORT (
        Cin      : IN  STD_LOGIC;
        X, Y     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        S        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout     : OUT STD_LOGIC;
        Overflow : OUT STD_LOGIC;
		  Sign     : OUT STD_LOGIC
    );
END lab3_ASU1;

ARCHITECTURE Behavior OF lab3_ASU1 IS
    SIGNAL Sum  : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL Ymod : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

    Ymod <= Y XOR ((NOT Cin) & (NOT Cin) & (NOT Cin) & (NOT Cin));

    Sum <= ('0' & X) + ('0' & Ymod) + (NOT Cin);

    S <= Sum(3 DOWNTO 0);

    Cout <= Sum(4);

    Overflow <= Sum(4) XOR Sum(3) XOR X(3) XOR Ymod(3);
	 
	 Sign <= Sum(3);

END Behavior;