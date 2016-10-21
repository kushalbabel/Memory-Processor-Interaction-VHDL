-- Purpose:- writing at some position and reading at the same position results in 
--  success for both the time.
 --                     
 --           write and reads two times using below set of commands:-
 --             -> usr_en="00000001" and dataOBus0=V for one clock cycle then reset them
 --             -> wait for 10 clock periods
 --             -> usr_en="10000000" and dataOBus0=V for one clock cycle then reset them --           First time usr_wr_res0 should output "11" in testbench and second time it should
 --           output "11" in testbench showing that second request was successful.


---------------------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY scopemaxx_tb1 IS
END scopemaxx_tb1;
 
ARCHITECTURE behavior OF scopemaxx_tb1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
		
	COMPONENT random_number_generator
	PORT(
		clk : IN std_logic;          
		random_num : OUT std_logic_vector(127 downto 0)
		);
	END COMPONENT;
	
	COMPONENT random_generator_proc
	PORT(
		clk : IN std_logic;          
		random_num : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;
	
	 COMPONENT scopemaxx_top
    PORT(
         clk : IN  std_logic;
         clk2 : IN STD_LOGIC;
			rst : IN  std_logic;
         usr_en : IN  std_logic_vector(7 downto 0);
			write_ptr : IN std_logic_vector (8 downto 0);
         dataOBus0 : IN  std_logic_vector(127 downto 0);
         dataOBus1 : IN  std_logic_vector(127 downto 0);
         dataOBus2 : IN  std_logic_vector(127 downto 0);
         dataOBus3 : IN  std_logic_vector(127 downto 0);
         dataOBus4 : IN  std_logic_vector(8 downto 0);
         dataOBus5 : IN  std_logic_vector(8 downto 0);
         dataOBus6 : IN  std_logic_vector(8 downto 0);
         dataOBus7 : IN  std_logic_vector(8 downto 0);
			
         usr_wr_res0 : OUT  std_logic_vector(1 downto 0);
         usr_wr_res1 : OUT  std_logic_vector(1 downto 0);
         usr_wr_res2 : OUT  std_logic_vector(1 downto 0);
         usr_wr_res3 : OUT  std_logic_vector(1 downto 0);
         usr_rd_res0 : OUT  std_logic_vector(1 downto 0);
         usr_rd_res1 : OUT  std_logic_vector(1 downto 0);
         usr_rd_res2 : OUT  std_logic_vector(1 downto 0);
         usr_rd_res3 : OUT  std_logic_vector(1 downto 0);
         rd_0 : OUT  std_logic_vector(127 downto 0);
         rd_1 : OUT  std_logic_vector(127 downto 0);
         rd_2 : OUT  std_logic_vector(127 downto 0);
         rd_3 : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
	signal clk2 : std_logic := '0';
   signal rst : std_logic := '0';
   signal usr_en : std_logic_vector(7 downto 0) := (others => '0');
   signal dataOBus0 : std_logic_vector(127 downto 0) := (others => '1');
   signal dataOBus1 : std_logic_vector(127 downto 0) := (others => '1');
   signal dataOBus2 : std_logic_vector(127 downto 0) := (others => '1');
   signal dataOBus3 : std_logic_vector(127 downto 0) := (others => '1');
   signal dataOBus4 : std_logic_vector(8 downto 0) := (others => '1');
   signal dataOBus5 : std_logic_vector(8 downto 0) := (others => '1');
   signal dataOBus6 : std_logic_vector(8 downto 0) := (others => '1');
   signal dataOBus7 : std_logic_vector(8 downto 0) := (others => '1');
	
	signal random1 : std_logic_vector(127 downto 0) := (others => '0');
	signal random2,write_ptr: std_logic_vector(8 downto 0) := (others => '0');

 	--Outputs
   signal usr_wr_res0 : std_logic_vector(1 downto 0);
   signal usr_wr_res1 : std_logic_vector(1 downto 0);
   signal usr_wr_res2 : std_logic_vector(1 downto 0);
   signal usr_wr_res3 : std_logic_vector(1 downto 0);
   signal usr_rd_res0 : std_logic_vector(1 downto 0);
   signal usr_rd_res1 : std_logic_vector(1 downto 0);
   signal usr_rd_res2 : std_logic_vector(1 downto 0);
   signal usr_rd_res3 : std_logic_vector(1 downto 0);
   signal rd_0 : std_logic_vector(127 downto 0);
   signal rd_1 : std_logic_vector(127 downto 0);
   signal rd_2 : std_logic_vector(127 downto 0);
   signal rd_3 : std_logic_vector(127 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 ns;
	constant clk_period2 : time := 4 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: scopemaxx_top PORT MAP (
          clk => clk,
			 clk2 => clk2,
          rst => rst,
          usr_en => usr_en,
			 write_ptr => write_ptr,
          dataOBus0 => dataOBus0,
          dataOBus1 => dataOBus1,
          dataOBus2 => dataOBus2,
          dataOBus3 => dataOBus3,
          dataOBus4 => dataOBus4,
          dataOBus5 => dataOBus5,
          dataOBus6 => dataOBus6,
          dataOBus7 => dataOBus7,
          usr_wr_res0 => usr_wr_res0,
          usr_wr_res1 => usr_wr_res1,
          usr_wr_res2 => usr_wr_res2,
          usr_wr_res3 => usr_wr_res3,
          usr_rd_res0 => usr_rd_res0,
          usr_rd_res1 => usr_rd_res1,
          usr_rd_res2 => usr_rd_res2,
          usr_rd_res3 => usr_rd_res3,
          rd_0 => rd_0,
          rd_1 => rd_1,
          rd_2 => rd_2,
          rd_3 => rd_3
        );
		  
			Inst_random_number_generator: random_number_generator PORT MAP(
		clk => clk,
		random_num => random1
	);
	
	Inst_random_generator_proc: random_generator_proc PORT MAP(
		clk => clk,
		random_num => random2
	);

	
	


   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	 clk_process2 :process
   begin
		clk2 <= '0';
		wait for clk_period2/2;
		clk2 <= '1';
		wait for clk_period2/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <='1';
		
      wait for clk_period*10;
		
		rst <= '0';

    wait for clk_period*2;
    usr_en <= "00000001";
	 write_ptr <= "000000001";
	 
	 wait for clk_period*1;
	 usr_en <= "00000000";
	 
	 wait for clk_period*10;
	 usr_en <= "00000000";
    
	 wait for clk_period*1;
	 usr_en <= "10000000";
	 dataOBus7 <= "000000001";
	 
	 wait for clk_period*1;
	 usr_en <= "00000000";
		

      -- insert stimulus here 

      wait;
   end process;

END;
