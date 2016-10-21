----------------------------------------------------------------------------------
-- Company: Scopemaxx
-- Engineer: Kushal Babel
-- 
-- Create Date:    17:59:41 04/05/2016 
-- Design Name: 
-- Module Name:    lane_interface - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lane_interface is
    Port (  dataIO1 : out  STD_LOGIC_VECTOR (127 downto 0);
            dataIO2 : out  STD_LOGIC_VECTOR (127 downto 0);
            dataIO3 : out  STD_LOGIC_VECTOR (127 downto 0);
            dataIO4 : out  STD_LOGIC_VECTOR (127 downto 0);
            dataIO5 : out  STD_LOGIC_VECTOR (8 downto 0);
            dataIO6 : out  STD_LOGIC_VECTOR (8 downto 0);
            dataIO7 : out  STD_LOGIC_VECTOR (8 downto 0);
            dataIO8 : out  STD_LOGIC_VECTOR (8 downto 0);

            req_in1 : in STD_LOGIC_VECTOR (127 downto 0);
            req_in2 : in STD_LOGIC_VECTOR (127 downto 0);
            req_in3 : in STD_LOGIC_VECTOR (127 downto 0);
            req_in4 : in STD_LOGIC_VECTOR (127 downto 0);
            req_in5 : in STD_LOGIC_VECTOR (8 downto 0);
            req_in6 : in STD_LOGIC_VECTOR (8 downto 0);
            req_in7 : in STD_LOGIC_VECTOR (8 downto 0);
            req_in8 : in STD_LOGIC_VECTOR (8 downto 0);

            wr_en1 : in STD_LOGIC ;
            wr_en2 : in STD_LOGIC ;
            wr_en3 : in STD_LOGIC ;
            wr_en4 : in STD_LOGIC ;
            wr_en5 : in STD_LOGIC ;
            wr_en6 : in STD_LOGIC ;
            wr_en7 : in STD_LOGIC ;
            wr_en8 : in STD_LOGIC ;

            rd_en1 : in STD_LOGIC ;
            rd_en2 : in STD_LOGIC ;
            rd_en3 : in STD_LOGIC ;
            rd_en4 : in STD_LOGIC ;
            rd_en5 : in STD_LOGIC ;
            rd_en6 : in STD_LOGIC ;
            rd_en7 : in STD_LOGIC ;
            rd_en8 : in STD_LOGIC ;
				
				datacount1 : out STD_LOGIC_VECTOR (4 downto 0);
				datacount2 : out STD_LOGIC_VECTOR (4 downto 0);
				datacount3 : out STD_LOGIC_VECTOR (4 downto 0);
				datacount4 : out STD_LOGIC_VECTOR (4 downto 0);
				datacount5 : out STD_LOGIC_VECTOR (4 downto 0);
				datacount6 : out STD_LOGIC_VECTOR (4 downto 0);
				datacount7 : out STD_LOGIC_VECTOR (4 downto 0);
				datacount8 : out STD_LOGIC_VECTOR (4 downto 0);

            clk : in STD_LOGIC ;
            reset : in STD_LOGIC 

            );
              
end lane_interface;

architecture Behavioral of lane_interface is
signal full, empty : STD_LOGIC;
COMPONENT myfifo128
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    data_count : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END COMPONENT;
  

COMPONENT myfifo9
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
	 data_count : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
  
  END COMPONENT;
begin

f1 : myfifo128
  PORT MAP (
    clk => clk,
    srst => reset,
    din => req_in1,
    wr_en => wr_en1,
    rd_en => rd_en1,
    dout => dataIO1,
    full => full,
    empty => empty,
	 data_count => datacount1
  );

  f2 : myfifo128
  PORT MAP (
    clk => clk,
    srst => reset,
    din => req_in2,
    wr_en => wr_en2,
    rd_en => rd_en2,
    dout => dataIO2,
    full => full,
    empty => empty,
	 data_count => datacount2
  );

  f3 : myfifo128
  PORT MAP (
    clk => clk,
    srst => reset,
    din => req_in3,
    wr_en => wr_en3,
    rd_en => rd_en3,
    dout => dataIO3,
    full => full,
    empty => empty,
	 data_count => datacount3
  );

  f4 : myfifo128
  PORT MAP (
    clk => clk,
    srst => reset,
    din => req_in4,
    wr_en => wr_en4,
    rd_en => rd_en4,
    dout => dataIO4,
    full => full,
    empty => empty,
	 data_count => datacount4
  );


f5 : myfifo9
  PORT MAP (
    clk => clk,
    srst => reset,
    din => req_in5,
    wr_en => wr_en5,
    rd_en => rd_en5,
    dout => dataIO5,
    full => full,
    empty => empty,
	 data_count => datacount5
  );
  

  f6 : myfifo9
  PORT MAP (
    clk => clk,
    srst => reset,
    din => req_in6,
    wr_en => wr_en6,
    rd_en => rd_en6,
    dout => dataIO6,
    full => full,
    empty => empty,
	 data_count => datacount6
  );

  f7 : myfifo9
  PORT MAP (
    clk => clk,
    srst => reset,
    din => req_in7,
    wr_en => wr_en7,
    rd_en => rd_en7,
    dout => dataIO7,
    full => full,
    empty => empty,
	 data_count => datacount7
  );

  f8 : myfifo9
  PORT MAP (
    clk => clk,
    srst => reset,
    din => req_in8,
    wr_en => wr_en8,
    rd_en => rd_en8,
    dout => dataIO8,
    full => full,
    empty => empty,
	 data_count => datacount8
  );


end Behavioral;
