----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:46:48 04/05/2016 
-- Design Name: 
-- Module Name:    smart_arbiter - Behavioral 
-- Project Name: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity smart_arbiter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           gnt : in  STD_LOGIC;
           done : out  STD_LOGIC;
           wr_size0 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_size0 : in  STD_LOGIC_VECTOR (4 downto 0);
           wr_size1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_size1 : in  STD_LOGIC_VECTOR (4 downto 0);
           wr_size2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_size2 : in  STD_LOGIC_VECTOR (4 downto 0);
           wr_size3 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_size3 : in  STD_LOGIC_VECTOR (4 downto 0);
			  sel_lanes : out  STD_LOGIC_VECTOR (4 downto 0));
end smart_arbiter;

architecture Behavioral of smart_arbiter is
signal states : std_logic_vector(2 downto 0) := "000";
begin

  process(rst,clk)
  variable compare,cr_0,cr_1,cr_2,cr_3,cw_0,cw_1,cw_2,cw_3,select_lanes : std_logic_vector(4 downto 0) := "00000";
  begin
    
	 
	 if rst='1' then
	 sel_lanes <= (others => '0');
	        states<="000";
			  done<='0';
	 elsif clk='1' then
	    compare:="00001";
		 
		 cr_0:=rd_size0;
		 cr_1:=rd_size1;
		 cr_2:=rd_size2;
		 cr_3:=rd_size3;
		 
		 cw_0:=wr_size0;
		 cw_1:=wr_size1;
		 cw_2:=wr_size2;
		 cw_3:=wr_size3;
		 
		 select_lanes:="00000";
		 
		 if compare>cr_0 then
		  else
		   select_lanes:="00001";
			compare:=cr_0;
		 end if;
		 
		 if compare>cr_1 then
		  else
		   select_lanes:="00010";
			compare:=cr_1;
		 end if;
		 
		 if compare>cr_2 then
		  else
		   select_lanes:="00100";
			compare:=cr_2;
		 end if;
		 
		 if compare>cr_3 then
		  else
		   select_lanes:="01000";
			compare:=cr_3;
		 end if;
		 
		 if compare>cw_0 then
		  else
		   select_lanes:="10001";
			compare:=cw_0;
		 end if;
		 
		 if compare>cw_1 then
		  else
		   select_lanes:="10010";
			compare:=cw_1;
		 end if;
		 
		 if compare>cw_2 then
		  else
		   select_lanes:="10100";
			compare:=cw_2;
		 end if;
		 
		 if compare>cw_3 then
		  else
		   select_lanes:="11000";
			compare:=cw_3;
		 end if;
		 
		 sel_lanes<=select_lanes;
		 
		 if states="000" and gnt='1' then
		     states<="001";
		 end if;
		 
		 if states="001" and select_lanes /="00000" then
		    done<='1';
			 states<="010";
		 end if;
		 
		 if states="010" then
		   done<='0';
			states<="000";
		 end if;	
		 
	 end if;
	 
  end process;  


end Behavioral;
