----------------------------------------------------------------------------------
-- Company: Scopemaxx
-- Engineer: Kushal Babel
-- 
-- Create Date:    17:50:29 04/04/2016 
-- Design Name: 
-- Module Name:    memory_interface - Behavioral 
-- Project Name: final
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory_interface is

Port (  wr : in  STD_LOGIC;
      rd : in  STD_LOGIC;
      --wr_proc : in  STD_LOGIC;
      --read_proc : in  STD_LOGIC;
      proc_IO : inout STD_LOGIC_VECTOR (31 downto 0) := (others => 'Z');
      mem_IO1 : inout STD_LOGIC_VECTOR (31 downto 0);
      mem_IO2 : inout STD_LOGIC_VECTOR (31 downto 0);
      mem_IO3 : inout STD_LOGIC_VECTOR (31 downto 0);
      mem_IO4 : inout STD_LOGIC_VECTOR (31 downto 0);
      wr_response : in STD_LOGIC_VECTOR(1 downto 0);      
      clk : in STD_LOGIC ;
      reset : in STD_LOGIC
    );

end memory_interface;

architecture Behavioral of memory_interface is

signal store1,store2,store3,store4 : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
type state_type is (idol,f1,f2,f3,f4,f5,e1,e2,e3,e4,e5,e6);
signal currState : state_type := idol; 
signal nextState : state_type := idol; 


signal data_1: std_logic_vector(31 downto 0);
signal data_2: std_logic_vector(31 downto 0);
signal data_3: std_logic_vector(31 downto 0);
signal data_4: std_logic_vector(31 downto 0);
signal data_proc: std_logic_vector(31 downto 0);
signal wr_en_internal : std_logic := '0';
signal proc_wr_en_internal : std_logic := '0';

begin

proc_IO <= data_proc when proc_wr_en_internal = '1' else
	"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

mem_IO1 <= data_1 when wr_en_internal = '1' else
  "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

mem_IO2 <= data_2 when wr_en_internal = '1' else
  "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

mem_IO3 <= data_3 when wr_en_internal = '1' else
  "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

mem_IO4 <= data_4 when wr_en_internal = '1' else
  "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

process (wr,rd,clk, wr_response,reset)

begin 

	if reset = '1' then
  wr_en_internal  <= '0';
  proc_wr_en_internal  <= '0';
  data_proc <= (others => '0');
  data_1 <= (others => '0');
  data_2 <= (others => '0');
  data_3<= (others => '0');
  data_4 <= (others => '0');
 
  elsif clk'event and clk = '1' then 
  
  if wr_response /= "00" then
    wr_en_internal <= '0';
  end if;

	
  if (wr = '1' and currState = idol) then 
    proc_wr_en_internal <= '0';
    currstate <= f2;
    data_1 <= proc_IO;

  else 
    if (rd = '1' and currState = idol) then 
      store1 <= mem_IO1;
      store2 <= mem_IO2;
      store3 <= mem_IO3;
      store4 <= mem_IO4;
      proc_wr_en_internal <= '1';
      currState <= e2;
    end if;
  end if;

    case currState is

      when f2 =>
        proc_wr_en_internal <= '0';
        data_2 <= proc_IO ;
        currState <= f3;

      when f3 =>
        proc_wr_en_internal <= '0';
        data_3 <= proc_IO;
        currState <= f4;

      when f4 => 
        proc_wr_en_internal <= '0';
        data_4 <= proc_IO;
        currState <= idol;
		  proc_wr_en_internal <= '0';
        wr_en_internal <= '1';
      
     -- when f5 =>
       -- proc_wr_en_internal <= '0';
        --wr_en_internal <= '1';
        --currState <= idol;
        
      when e2 =>
        proc_wr_en_internal <= '1';
        data_proc <= store1;
        currState <= e3;
      
      when e3 =>
        proc_wr_en_internal <= '1';
        data_proc <= store2;
        currState <= e4;
      
      when e4 =>
        proc_wr_en_internal <= '1';
        data_proc <= store3;
        currState <= e5;
        
      when e5 =>
        proc_wr_en_internal <= '1';
        data_proc <= store4;
        currState <= e6;
		
		when e6 =>
        proc_wr_en_internal <= '0';
        currState <= idol;
  
      when others =>
        proc_wr_en_internal <= '0';
        --do nothing
    end case;
end if;
end process;

State_assignment: process (clk, reset)
  begin  -- process State_assignment


      -- do nothing
   
      if clk'event and clk = '1' then
      --currState <= currState;
      end if;
  end process State_assignment;

end Behavioral;
