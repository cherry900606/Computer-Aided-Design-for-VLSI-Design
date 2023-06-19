library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Lottery is
port( clk, en, sel : in std_logic;
		seed : in std_logic_vector(63 downto 0);
		result : out integer range 0 to 20);
end Lottery;

architecture archi of Lottery is
	
component RNG
	port(seed : in std_logic_vector(63 downto 0);
		   clk, sel : in std_logic;
		   rng_out : out std_logic_vector(63 downto 0)
	   );
end component;
signal rng_out : std_logic_vector(63 downto 0);
signal module_out : integer range 0 to 20;

begin

	random : RNG port map(seed, clk, sel, rng_out);
	
	module_out <= to_integer(unsigned(rng_out)) mod 21;
	
	process(clk)
	begin
		if clk'event and clk = '1' then
			if en = '1' then
				result <= module_out;
			end if;
		end if;
	end process;
end archi;