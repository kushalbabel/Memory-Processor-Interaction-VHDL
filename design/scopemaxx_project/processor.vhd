----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:28:00 04/04/2016 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC:='0';
           done : in  STD_LOGIC;
           sel_lane : in  STD_LOGIC_VECTOR (4 downto 0);
           wr_en_mem : out  STD_LOGIC := '0';
           rd_en_mem : out  STD_LOGIC := '0';
           wr_en_int : inout  STD_LOGIC;
           rd_en_int : out  STD_LOGIC := '0';
           ptr : out  STD_LOGIC_VECTOR (8 downto 0) := (others => '0');
           --ptr_correct : out  STD_LOGIC;
           wr_res : in  STD_LOGIC_VECTOR (1 downto 0);
           rd_res : in  STD_LOGIC_VECTOR (1 downto 0);
           rand_ptr : in STD_LOGIC_VECTOR (8 downto 0);
           gnt: out STD_LOGIC;
           mem_int_signal : inout  STD_LOGIC_VECTOR (31 downto 0) := (others => 'Z');
           user_wr_res_0 : out  STD_LOGIC_VECTOR (1 downto 0);
           user_wr_res_1 : out  STD_LOGIC_VECTOR (1 downto 0);
           user_wr_res_2 : out  STD_LOGIC_VECTOR (1 downto 0);
           user_wr_res_3 : out  STD_LOGIC_VECTOR (1 downto 0);
           user_rd_res_0 : out  STD_LOGIC_VECTOR (1 downto 0);
           user_rd_res_1 : out  STD_LOGIC_VECTOR (1 downto 0);
           user_rd_res_2 : out  STD_LOGIC_VECTOR (1 downto 0);
           user_rd_res_3 : out  STD_LOGIC_VECTOR (1 downto 0);
        lane_rd_ptr_0 : in  STD_LOGIC_VECTOR (8 downto 0);
           lane_rd_ptr_1 : in  STD_LOGIC_VECTOR (8 downto 0);
           lane_rd_ptr_2 : in  STD_LOGIC_VECTOR (8 downto 0);
           lane_rd_ptr_3 : in  STD_LOGIC_VECTOR (8 downto 0);
           rd_0 : out  STD_LOGIC_VECTOR (127 downto 0);
           rd_1 : out  STD_LOGIC_VECTOR (127 downto 0);
           rd_2 : out  STD_LOGIC_VECTOR (127 downto 0);
           rd_3 : out  STD_LOGIC_VECTOR (127 downto 0);
           lane_wr_0 : in  STD_LOGIC_VECTOR (127 downto 0);
        lane_wr_1 : in  STD_LOGIC_VECTOR (127 downto 0);
        lane_wr_2 : in  STD_LOGIC_VECTOR (127 downto 0);
        lane_wr_3 : in  STD_LOGIC_VECTOR (127 downto 0);
           lane_en_rd_0: out STD_LOGIC ;
           lane_en_rd_1: out STD_LOGIC ;
           lane_en_rd_2: out STD_LOGIC ;
           lane_en_rd_3: out STD_LOGIC;
           lane_en_wr_0: out STD_LOGIC ;
           lane_en_wr_1: out STD_LOGIC ;
           lane_en_wr_2: out STD_LOGIC ;
           lane_en_wr_3: out STD_LOGIC        
        );
           
end processor;

architecture Behavioral of processor is
signal processor_states : STD_LOGIC_VECTOR (4 downto 0):="00000";
signal select_lane : STD_LOGIC_VECTOR (4 downto 0):="00000";
signal proc_IO : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal var:STD_LOGIC:='1';
begin

--mem_int_signal <= proc_IO when wr_ = '1' else
 --       "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
 

 

process(clk,reset)
variable i : STD_LOGIC_VECTOR (7 downto 0) :="00000000";
begin
if reset='1' then
   processor_states<="00000";
  gnt<='1';
  wr_en_int <= '0';
  rd_en_int <= '0';
  select_lane <= "00000";
  user_wr_res_0 <= "00";
  user_wr_res_1 <= "00";
  user_wr_res_2 <= "00";
  user_wr_res_3 <= "00";
  user_rd_res_0 <= "00";
  user_rd_res_1 <= "00";
  user_rd_res_2 <= "00";
  user_rd_res_3 <= "00";
  var <= '1';


  lane_en_wr_0 <= '0';
  lane_en_wr_1 <= '0';
  lane_en_wr_2 <= '0';
  lane_en_wr_3 <= '0';
  lane_en_rd_0 <= '0';
  lane_en_rd_1 <= '0';
  lane_en_rd_2 <= '0';
  lane_en_rd_3 <= '0';


  rd_0 <= (others => '0');
  rd_1 <= (others => '0');
  rd_2 <= (others => '0');
  rd_3 <= (others => '0');
  proc_IO <= (others => '0');
elsif clk='1' then

	if  processor_states="11111" or processor_states="10010" or processor_states="10011" or processor_states="10100" then
	else
    for i in 0 to 31 loop
       mem_int_signal(i)<='Z';
    end loop;
  end if;
--////////////////idle////////////////////////////////////////

  
  if done='1' and  processor_states="00000" then
       gnt<='0';
		 var<='1';
     select_lane<=sel_lane;
       if sel_lane(4)='0' then 
       processor_states<="01110";
      
               if sel_lane(0)='1' then
           lane_en_rd_0<='1';
        end if;

                 if sel_lane(1)='1' then
           lane_en_rd_1<='1';
        end if;

                   if sel_lane(2)='1' then
           lane_en_rd_2<='1';
        end if;

                if sel_lane(3)='1' then
           lane_en_rd_3<='1';
        end if;
      
    else
       processor_states<="10001";
      
      if sel_lane(0)='1' then
           lane_en_wr_0<='1';
        end if;

        if sel_lane(1)='1' then
           lane_en_wr_1<='1';
        end if;

        if sel_lane(2)='1' then
           lane_en_wr_2<='1';
        end if;

        if sel_lane(3)='1' then
           lane_en_wr_3<='1';
        end if;
      
    end if; 
  end if;  

--//////////////////////////read////////////////////////////////
   
  if processor_states="01110" then
        processor_states<="00001";
        
      if select_lane(0)='1' then
           lane_en_rd_0<='0';
        end if;

        if select_lane(1)='1' then
           lane_en_rd_1<='0';
        end if;

        if select_lane(2)='1' then
           lane_en_rd_2<='0';
        end if;

        if select_lane(3)='1' then
           lane_en_rd_3<='0';
        end if;
      
   end if;
  
   if processor_states="00001" then
        processor_states<="00010";
        rd_en_mem<='1';
        rd_en_int<='0';
       
     if select_lane(0)='1' then
           for i in 0 to 8 loop
               ptr(i)<=lane_rd_ptr_0(i);
           end loop;
        end if;

        if select_lane(1)='1' then
           for i in 0 to 8 loop
               ptr(i)<=lane_rd_ptr_1(i);
           end loop;
        end if;

        if select_lane(2)='1' then
           for i in 0 to 8 loop
               ptr(i)<=lane_rd_ptr_2(i);
           end loop;
        end if;

        if select_lane(3)='1' then
           for i in 0 to 8 loop
               ptr(i)<=lane_rd_ptr_3(i);
           end loop;
        end if;
     
   end if;

--- 10 means location not filled
   if processor_states="00010" and rd_res="10" then
        processor_states<="00111";
        rd_en_mem<='0';
        rd_en_int<='0';
        if select_lane(0)='1' then
           user_rd_res_0<="10";
        end if;

        if select_lane(1)='1' then
           user_rd_res_1<="10";
        end if;

        if select_lane(2)='1' then
           user_rd_res_2<="10";
        end if;

        if select_lane(3)='1' then
           user_rd_res_3<="10";
        end if;
   end if;

--- 11 means location  filled
   if processor_states="00010" and rd_res="11" then
        processor_states<="01111";
        rd_en_mem<='0';
        rd_en_int<='1';
      
      if select_lane(0)='1' then
           user_rd_res_0<="11";
        end if;

        if select_lane(1)='1' then
           user_rd_res_1<="11";
        end if;

        if select_lane(2)='1' then
           user_rd_res_2<="11";
        end if;

        if select_lane(3)='1' then
           user_rd_res_3<="11";
        end if;
      
   end if;

-- dummy state
   if processor_states="01111"  then
        processor_states<="01011";
        rd_en_mem<='0';
        rd_en_int<='1';
      
      user_rd_res_0<="00";
           user_rd_res_1<="00";
           user_rd_res_2<="00";
           user_rd_res_3<="00";
      
   end if;   
	
	if processor_states="01011"  then
        processor_states<="00011";
    end if;

   if processor_states="00011" then
        processor_states<="00100";
        if select_lane(0)='1' then
           for i in 0 to 31 loop
               rd_0(i)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(1)='1' then
           for i in 0 to 31 loop
               rd_1(i)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(2)='1' then
           for i in 0 to 31 loop
               rd_2(i)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(3)='1' then
           for i in 0 to 31 loop
               rd_3(i)<=mem_int_signal(i);
           end loop;
        end if;
   end if;

----doing rd_en_int low
   if processor_states="00100" then
        processor_states<="00101";
        rd_en_int<='0';
        if select_lane(0)='1' then
           for i in 0 to 31 loop
               rd_0(i+32)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(1)='1' then
           for i in 0 to 31 loop
               rd_1(i+32)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(2)='1' then
           for i in 0 to 31 loop
               rd_2(i+32)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(3)='1' then
           for i in 0 to 31 loop
               rd_3(i+32)<=mem_int_signal(i);
           end loop;
        end if;
   end if;

   if processor_states="00101" then
        processor_states<="00110";
        if select_lane(0)='1' then
           for i in 0 to 31 loop
               rd_0(i+64)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(1)='1' then
           for i in 0 to 31 loop
               rd_1(i+64)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(2)='1' then
           for i in 0 to 31 loop
               rd_2(i+64)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(3)='1' then
           for i in 0 to 31 loop
               rd_3(i+64)<=mem_int_signal(i);
           end loop;
        end if;
   end if;

   if processor_states="00110" then
        processor_states<="00111";
        if select_lane(0)='1' then
        -- lane_int_rd_0<='1';
           for i in 0 to 31 loop
               rd_0(i+96)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(1)='1' then
         --lane_int_rd_1<='1';
           for i in 0 to 31 loop
               rd_1(i+96)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(2)='1' then
          --lane_int_rd_2<='1';
           for i in 0 to 31 loop
               rd_2(i+96)<=mem_int_signal(i);
           end loop;
        end if;

        if select_lane(3)='1' then
          --lane_int_rd_3<='1';
           for i in 0 to 31 loop
               rd_3(i+96)<=mem_int_signal(i);
           end loop;
        end if;
        rd_en_int<='0';
        --lane interface will handle user response
   end if;

   if processor_states="00111" then
        processor_states<="00000";
        lane_en_rd_0<='0';
      lane_en_rd_1<='0';
      lane_en_rd_2<='0';
      lane_en_rd_3<='0';
        gnt<='1';
           user_rd_res_0<="00";
        
           user_rd_res_1<="00";
        
           user_rd_res_2<="00";
       
           user_rd_res_3<="00";
        
   end if;

--/////////////////////////write///////////////////////////////////////
   
   if processor_states="10001"  then
        processor_states<="11110";
      
      if select_lane(0)='1' then
           lane_en_wr_0<='0';
        end if;

        if select_lane(1)='1' then
           lane_en_wr_1<='0';
        end if;

        if select_lane(2)='1' then
           lane_en_wr_2<='0';
        end if;

        if select_lane(3)='1' then
           lane_en_wr_3<='0';
        end if;
      
   end if;

   if processor_states="11110"  then
        processor_states<="11111";
		  var<='0';
   end if;

   if processor_states="11111" then
        processor_states<="10010";
        wr_en_int<='1';
        ptr<=rand_ptr;        

         
      if select_lane(0)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_0(i);
           end loop;
        end if;

        if select_lane(1)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_1(i);
           end loop;
        end if;

        if select_lane(2)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_2(i);
           end loop;
        end if;

        if select_lane(3)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_3(i);
           end loop;
        end if;
      
   end if;

   if processor_states="10010"  then
        processor_states<="10011";
              if select_lane(0)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_0(i+32);
           end loop;
        end if;

        if select_lane(1)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_1(i+32);
           end loop;
        end if;

        if select_lane(2)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_2(i+32);
           end loop;
        end if;

        if select_lane(3)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_3(i+32);
           end loop;
        end if;
      
   end if;

   if processor_states="10011" then
        processor_states<="10100";
        
      
            if select_lane(0)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_0(i+64);
           end loop;
        end if;

        if select_lane(1)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_1(i+64);
           end loop;
        end if;

        if select_lane(2)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_2(i+64);
           end loop;
        end if;

        if select_lane(3)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_3(i+64);
           end loop;
        end if;
      
        
        
   end if;

   if processor_states="10100" then
        processor_states<="10101";
        
            if select_lane(0)='1' then
           for i in 0 to 31 loop
              mem_int_signal(i)<=lane_wr_0(i+96);
           end loop;
        end if;

        if select_lane(1)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_1(i+96);
           end loop;
        end if;

        if select_lane(2)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_2(i+96);
           end loop;
        end if;

        if select_lane(3)='1' then
           for i in 0 to 31 loop
               mem_int_signal(i)<=lane_wr_3(i+96);
           end loop;
        end if;
      
        
        wr_en_int<='0';   
   end if;

   if processor_states="10101" then
        processor_states<="10110";
        wr_en_mem<='1';
		  var<='1';
   end if;

--location incorrect
   if processor_states="10110" and wr_res="10" then
        processor_states<="11101";
        gnt<='1';
        wr_en_mem<='0';
        if select_lane(0)='1' then
           user_wr_res_0<="10";
        end if;

        if select_lane(1)='1' then
           user_wr_res_1<="10";
        end if;

        if select_lane(2)='1' then
           user_wr_res_2<="10";
        end if;

        if select_lane(3)='1' then
           user_wr_res_3<="10";
        end if;
   end if;
--location correct
   if processor_states="10110" and wr_res="11" then
        processor_states<="11101";
        if select_lane(0)='1' then
           user_wr_res_0<="11";
        end if;

        if select_lane(1)='1' then
           user_wr_res_1<="11";
        end if;

        if select_lane(2)='1' then
           user_wr_res_2<="11";
        end if;

        if select_lane(3)='1' then
           user_wr_res_3<="11";
        end if;
        wr_en_mem<='0';
   end if;

if processor_states="11101"  then
        user_wr_res_0<="00";
        user_wr_res_1<="00";
        user_wr_res_2<="00";
        user_wr_res_3<="00";
        processor_states<="00000";
        gnt<='1';
        wr_en_mem<='0';
   end if;


--///////////////////////////////////////////////////////////////////
end if;
end process;
end Behavioral;
