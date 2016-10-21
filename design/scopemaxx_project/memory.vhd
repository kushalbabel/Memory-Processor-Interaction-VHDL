----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Govind Lahoti
-- 
-- Create Date:    18:17:41 04/04/2016 
-- Design Name: 
-- Module Name:    memory - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity memory is 
port(
	clk : in std_logic;
	wr_en : in std_logic;
	rd_en : in std_logic;
	ptr : in std_logic_vector(8 downto 0);
	wr_response : out std_logic_vector(1 downto 0);
	rd_response : out std_logic_vector(1 downto 0);
	io_1 : inout std_logic_vector(31 downto 0);
	io_2 : inout std_logic_vector(31 downto 0);
	io_3 : inout std_logic_vector(31 downto 0);
	io_4 : inout std_logic_vector(31 downto 0);
	reset : in STD_LOGIC 
);
end memory;

architecture Behavioral of memory is

signal data_1: std_logic_vector(31 downto 0);
signal data_2: std_logic_vector(31 downto 0);
signal data_3: std_logic_vector(31 downto 0);
signal data_4: std_logic_vector(31 downto 0);
signal wr_en_internal : std_logic;

signal random_word : std_logic_vector(127 downto 0);
signal is_memory_occupied : std_logic_vector (511 downto 0) := (others => '0');

component random_number_generator
port (
	clk : in std_logic;
	random_num : out std_logic_vector (127 downto 0) --output vector 
);
end component;

begin

io_1 <= data_1 when wr_en_internal = '1' else
	"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

io_2 <= data_2 when wr_en_internal = '1' else
	"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

io_3 <= data_3 when wr_en_internal = '1' else
	"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

io_4 <= data_4 when wr_en_internal = '1' else
	"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

random: random_number_generator PORT MAP(
	clk => clk,
	random_num => random_word
);

process(clk, reset)
begin
	if reset = '1' then 
		is_memory_occupied <= (others => '0');
		wr_en_internal <= '0';
		data_1 <= (others => '0');
		data_2 <= (others => '0');
		data_3 <= (others => '0');
		data_4 <= (others => '0');
		wr_response <= "00";
		rd_response <= "00";
	else 
	if clk = '1' then
		if wr_en = '1' then
			if ptr < 320 and is_memory_occupied(conv_integer(ptr)) = '0' then
			   is_memory_occupied(conv_integer(ptr))<='1';
				wr_response <= "11";
			else
				wr_response <= "10";
			end if; 
		elsif rd_en = '1' then
			data_1 <= random_word(127 downto 96);
			data_2 <= random_word(95 downto 64);
			data_3 <= random_word(63 downto 32);
			data_4 <= random_word(31 downto 0);
			wr_en_internal <= '1';
			if ptr < 320 and is_memory_occupied(conv_integer(ptr)) = '1' then
			  rd_response <= "11";
			else
			  rd_response <= "10";
			end if;
		end if;
	elsif clk = '0' then
		wr_response <= "00";
		rd_response <= "00";
		wr_en_internal <= '0';
	end if;
	end if;
end process;

end Behavioral;