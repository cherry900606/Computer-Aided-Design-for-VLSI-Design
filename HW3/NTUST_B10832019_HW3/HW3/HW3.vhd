entity HW3 is
port( clk : in bit;
		g_light, y_light, r_light : out bit);
end HW3;

architecture dataflow of HW3 is
type mstate is (green1, green2, red1, red2, yellow1, yellow2);
signal present_state, next_state : mstate;
signal reset, enable, complete : bit := '0';
signal counter : integer range 0 to 3;
begin
	process(present_state, complete)
	begin
		case present_state is
			when green1 =>
				g_light <= '1';
				y_light <= '0';
				r_light <= '0';
				reset <= '1';
				next_state <= green2;
			when green2 =>
				g_light <= '1';
				y_light <= '0';
				r_light <= '0';
				reset <= '0';
				enable <= '1';
				if complete = '1' then
					next_state <= yellow1;
				else
					next_state <= green2;
				end if;
			when red1 =>
				g_light <= '0';
				y_light <= '0';
				r_light <= '1';
				reset <= '1';
				next_state <= red2;
			when red2 =>
				g_light <= '0';
				y_light <= '0';
				r_light <= '1';
				reset <= '0';
				enable <= '1';
				if complete = '1' then
					next_state <= yellow2;
				else
					next_state <= red2;
				end if;
			when yellow1 =>
				g_light <= '0';
				y_light <= '1';
				r_light <= '0';
				enable <= '0';
				next_state <= red1;
			when yellow2 =>
				g_light <= '0';
				y_light <= '1';
				r_light <= '0';
				enable <= '0';
				next_state <= green1;
		end case;
	end process;
	
	process
	begin
		wait until clk'event and clk = '1';
		present_state <= next_state;
		if reset = '1' then
			counter <= 0;
		elsif enable = '1' then
			counter <= counter + 1;
		end if;
	end process;
	
	process(counter)
	begin
		if counter = 3 then
			complete <= '1';
		else
			complete <= '0';
		end if;
	end process;
end dataflow;