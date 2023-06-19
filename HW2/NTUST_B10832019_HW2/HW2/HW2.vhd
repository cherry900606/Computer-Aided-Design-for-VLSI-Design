library ieee;
use ieee.numeric_bit.all;
use ieee.std_logic_1164.all;

entity HW2 is
port(
	clk : in bit;
	D_in : in unsigned(3 downto 0);
	A, B, C : out unsigned(3 downto 0);
	Y : out std_logic_vector(2 downto 0));
end HW2;

architecture My_ckt_1 of HW2 is
signal reg_0, reg_1, reg_2 : unsigned(3 downto 0);
begin
	A <= reg_0;
	B <= reg_1;
	C <= reg_2;
	
	process(clk)
	begin
		if(clk'EVENT and clk = '1') then
			reg_0 <= D_in;
			reg_1 <= reg_0;
			reg_2 <= reg_1;
		end if;
	end process;
	
	process(reg_0, reg_1, reg_2)
	begin
		if( reg_0 < reg_1 and reg_0 < reg_2) then
			Y <= "100";
		elsif( reg_1 < reg_0 and reg_1 < reg_2) then
			Y <= "010";
		elsif( reg_2 < reg_0 and reg_2 < reg_1) then
			Y <= "001";
		else
			Y <= "000";
		end if;
	end process;
end My_ckt_1;