
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity scopemaxx_top is
    Port ( clk : in  STD_LOGIC;
				clk2 : IN STD_LOGIC;
           rst : in  STD_LOGIC;
			  write_ptr : IN STD_LOGIC_VECTOR (8 downto 0);
           usr_en : in  STD_LOGIC_VECTOR (7 downto 0);
        --for read requests
           dataOBus0 : in  STD_LOGIC_VECTOR (127 downto 0);
           dataOBus1 : in  STD_LOGIC_VECTOR (127 downto 0);
           dataOBus2 : in  STD_LOGIC_VECTOR (127 downto 0);
        dataOBus3 : in  STD_LOGIC_VECTOR (127 downto 0);
        --for write requests
        dataOBus4 : in  STD_LOGIC_VECTOR (8 downto 0);
           dataOBus5 : in  STD_LOGIC_VECTOR (8 downto 0);
           dataOBus6 : in  STD_LOGIC_VECTOR (8 downto 0);
        dataOBus7 : in  STD_LOGIC_VECTOR (8 downto 0);
        --more request response outputs to come
        usr_wr_res0 : out std_logic_vector (1 downto 0);
        usr_wr_res1 : out std_logic_vector (1 downto 0);
        usr_wr_res2 : out std_logic_vector (1 downto 0);
        usr_wr_res3 : out std_logic_vector (1 downto 0);
        usr_rd_res0 : out std_logic_vector (1 downto 0);
        usr_rd_res1 : out std_logic_vector (1 downto 0);
        usr_rd_res2 : out std_logic_vector (1 downto 0);
        usr_rd_res3 : out std_logic_vector (1 downto 0);
        rd_0 : out std_logic_vector (127 downto 0);
        rd_1 : out std_logic_vector (127 downto 0);
        rd_2 : out std_logic_vector (127 downto 0);
        rd_3 : out std_logic_vector (127 downto 0)
        );
end scopemaxx_top;

architecture Behavioral of scopemaxx_top is

    COMPONENT random_generator_proc
  PORT(
    clk : IN std_logic;          
    random_num : OUT std_logic_vector(8 downto 0)
    );
  END COMPONENT;

  

  
  COMPONENT lane_interface
  PORT(
    req_in1 : IN std_logic_vector(127 downto 0);
    req_in2 : IN std_logic_vector(127 downto 0);
    req_in3 : IN std_logic_vector(127 downto 0);
    req_in4 : IN std_logic_vector(127 downto 0);
    req_in5 : IN std_logic_vector(8 downto 0);
    req_in6 : IN std_logic_vector(8 downto 0);
    req_in7 : IN std_logic_vector(8 downto 0);
    req_in8 : IN std_logic_vector(8 downto 0);
    wr_en1 : IN std_logic;
    wr_en2 : IN std_logic;
    wr_en3 : IN std_logic;
    wr_en4 : IN std_logic;
    wr_en5 : IN std_logic;
    wr_en6 : IN std_logic;
    wr_en7 : IN std_logic;
    wr_en8 : IN std_logic;
    rd_en1 : IN std_logic;
    rd_en2 : IN std_logic;
    rd_en3 : IN std_logic;
    rd_en4 : IN std_logic;
    rd_en5 : IN std_logic;
    rd_en6 : IN std_logic;
    rd_en7 : IN std_logic;
    rd_en8 : IN std_logic;
    clk : IN std_logic;
    reset : IN std_logic;          
    dataIO1 : OUT std_logic_vector(127 downto 0);
    dataIO2 : OUT std_logic_vector(127 downto 0);
    dataIO3 : OUT std_logic_vector(127 downto 0);
    dataIO4 : OUT std_logic_vector(127 downto 0);
    dataIO5 : OUT std_logic_vector(8 downto 0);
    dataIO6 : OUT std_logic_vector(8 downto 0);
    dataIO7 : OUT std_logic_vector(8 downto 0);
    dataIO8 : OUT std_logic_vector(8 downto 0);
    datacount1 : OUT std_logic_vector(4 downto 0);
    datacount2 : OUT std_logic_vector(4 downto 0);
    datacount3 : OUT std_logic_vector(4 downto 0);
    datacount4 : OUT std_logic_vector(4 downto 0);
    datacount5 : OUT std_logic_vector(4 downto 0);
    datacount6 : OUT std_logic_vector(4 downto 0);
    datacount7 : OUT std_logic_vector(4 downto 0);
    datacount8 : OUT std_logic_vector(4 downto 0)
    );
  END COMPONENT;

  COMPONENT processor
  PORT(
    clk : IN std_logic;
    reset : IN std_logic;
    done : IN std_logic;
    sel_lane : IN std_logic_vector(4 downto 0);
    wr_res : IN std_logic_vector(1 downto 0);
    rd_res : IN std_logic_vector(1 downto 0);
    rand_ptr : IN std_logic_vector(8 downto 0);
    lane_rd_ptr_0 : IN std_logic_vector(8 downto 0);
    lane_rd_ptr_1 : IN std_logic_vector(8 downto 0);
    lane_rd_ptr_2 : IN std_logic_vector(8 downto 0);
    lane_rd_ptr_3 : IN std_logic_vector(8 downto 0);
    lane_wr_0 : IN std_logic_vector(127 downto 0);
    lane_wr_1 : IN std_logic_vector(127 downto 0);
    lane_wr_2 : IN std_logic_vector(127 downto 0);
    lane_wr_3 : IN std_logic_vector(127 downto 0);    
    mem_int_signal : INOUT std_logic_vector(31 downto 0);      
    wr_en_mem : OUT std_logic;
    rd_en_mem : OUT std_logic;
    wr_en_int : INOUT std_logic;
    rd_en_int : OUT std_logic;
    ptr : OUT std_logic_vector(8 downto 0);
    gnt : OUT std_logic;
    user_wr_res_0 : OUT std_logic_vector(1 downto 0);
    user_wr_res_1 : OUT std_logic_vector(1 downto 0);
    user_wr_res_2 : OUT std_logic_vector(1 downto 0);
    user_wr_res_3 : OUT std_logic_vector(1 downto 0);
    user_rd_res_0 : OUT std_logic_vector(1 downto 0);
    user_rd_res_1 : OUT std_logic_vector(1 downto 0);
    user_rd_res_2 : OUT std_logic_vector(1 downto 0);
    user_rd_res_3 : OUT std_logic_vector(1 downto 0);
    rd_0 : OUT std_logic_vector(127 downto 0);
    rd_1 : OUT std_logic_vector(127 downto 0);
    rd_2 : OUT std_logic_vector(127 downto 0);
    rd_3 : OUT std_logic_vector(127 downto 0);
    lane_en_rd_0 : OUT std_logic;
    lane_en_rd_1 : OUT std_logic;
    lane_en_rd_2 : OUT std_logic;
    lane_en_rd_3 : OUT std_logic;
    lane_en_wr_0 : OUT std_logic;
    lane_en_wr_1 : OUT std_logic;
    lane_en_wr_2 : OUT std_logic;
    lane_en_wr_3 : OUT std_logic
    );
  END COMPONENT;

  COMPONENT smart_arbiter
  PORT(
    clk : IN std_logic;
    rst : IN std_logic;
    gnt : IN std_logic;
    wr_size0 : IN std_logic_vector(4 downto 0);
    rd_size0 : IN std_logic_vector(4 downto 0);
    wr_size1 : IN std_logic_vector(4 downto 0);
    rd_size1 : IN std_logic_vector(4 downto 0);
    wr_size2 : IN std_logic_vector(4 downto 0);
    rd_size2 : IN std_logic_vector(4 downto 0);
    wr_size3 : IN std_logic_vector(4 downto 0);
    rd_size3 : IN std_logic_vector(4 downto 0);    
    sel_lanes : INOUT std_logic_vector(4 downto 0);      
    done : OUT std_logic
    );
  END COMPONENT;
  
  COMPONENT memory_interface
  PORT(
    wr : IN std_logic;
    rd : IN std_logic;
    --wr_proc : IN std_logic;
    --read_proc : IN std_logic;
    clk : IN std_logic;
    reset : IN std_logic;       
    proc_IO : INOUT std_logic_vector(31 downto 0);
    mem_IO1 : INOUT std_logic_vector(31 downto 0);
    mem_IO2 : INOUT std_logic_vector(31 downto 0);
    mem_IO3 : INOUT std_logic_vector(31 downto 0);
    mem_IO4 : INOUT std_logic_vector(31 downto 0);
	 wr_response : in STD_LOGIC_VECTOR(1 downto 0)
    );
  END COMPONENT;
  
  COMPONENT memory 
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
  END COMPONENT;
  
  -----------------------local signal---------------------------
  signal done,wr_en_mem, rd_en_mem, wr_en_int, rd_en_int, gnt : std_logic;
  signal lane_en_wr0, lane_en_wr1, lane_en_wr2, lane_en_wr3 : std_logic;
  signal lane_en_rd0, lane_en_rd1, lane_en_rd2, lane_en_rd3 : std_logic;
  signal sel_lane : std_logic_vector(4 downto 0);
  signal ptr_to_mem, rand_ptr ,lane_proc_rd0, lane_proc_rd1, lane_proc_rd2, lane_proc_rd3 : std_logic_vector(8 downto 0);
  signal wr_res, rd_res : std_logic_vector(1 downto 0);
  signal proc_int_bus, mem_int_bus1,mem_int_bus2, mem_int_bus3, mem_int_bus4 : std_logic_vector(31 downto 0);
   signal lane_proc_wr0, lane_proc_wr1, lane_proc_wr2, lane_proc_wr3, mem_int_bus : std_logic_vector(127 downto 0);
   signal wr_req, rd_req : std_logic_vector(3 downto 0);
  signal rd_size0, rd_size1, rd_size2, rd_size3 : std_logic_vector(4 downto 0);
  signal wr_size0, wr_size1, wr_size2, wr_size3 : std_logic_vector(4 downto 0);
  
begin

  Inst_random_generator_proc: random_generator_proc PORT MAP(
    clk => clk,
    random_num => rand_ptr
  );

  Inst_lane_interface: lane_interface PORT MAP(
    dataIO1 => lane_proc_wr0,
    dataIO2 => lane_proc_wr1,
    dataIO3 => lane_proc_wr2,
    dataIO4 => lane_proc_wr3,
    dataIO5 => lane_proc_rd0,
    dataIO6 => lane_proc_rd1,
    dataIO7 => lane_proc_rd2,
    dataIO8 => lane_proc_rd3,
	 
    req_in1 => dataOBus0,
    req_in2 => dataOBus1,
    req_in3 => dataOBus2,
    req_in4 => dataOBus3,
    req_in5 => dataOBus4,
    req_in6 => dataOBus5,
    req_in7 => dataOBus6,
    req_in8 => dataOBus7,
	 
    wr_en1 => usr_en(0),
    wr_en2 => usr_en(1),
    wr_en3 => usr_en(2),
    wr_en4 => usr_en(3),
    wr_en5 => usr_en(4),
    wr_en6 => usr_en(5),
    wr_en7 => usr_en(6),
    wr_en8 => usr_en(7),
    rd_en1 => lane_en_wr0,
    rd_en2 => lane_en_wr1,
    rd_en3 => lane_en_wr2,
    rd_en4 => lane_en_wr3,
    rd_en5 => lane_en_rd0,
    rd_en6 => lane_en_rd1,
    rd_en7 => lane_en_rd2,
    rd_en8 => lane_en_rd3,
    datacount1 => wr_size0,
    datacount2 => wr_size1,
    datacount3 => wr_size2,
    datacount4 => wr_size3,
    datacount5 => rd_size0,
    datacount6 => rd_size1,
    datacount7 => rd_size2,
    datacount8 => rd_size3,
    clk => clk,
    reset => rst
  );

  Inst_processor: processor PORT MAP(
    clk => clk,
    reset => rst,
    done => done,
    sel_lane => sel_lane,
    wr_en_mem => wr_en_mem,
    rd_en_mem => rd_en_mem,
    wr_en_int => wr_en_int,
    rd_en_int => rd_en_int,
    ptr => ptr_to_mem,
    wr_res => wr_res,
    rd_res => rd_res,
    rand_ptr => write_ptr,
    gnt => gnt,
    mem_int_signal => proc_int_bus,
    user_wr_res_0 => usr_wr_res0,
    user_wr_res_1 => usr_wr_res1,
    user_wr_res_2 => usr_wr_res2,
    user_wr_res_3 => usr_wr_res3,
    user_rd_res_0 => usr_rd_res0,
    user_rd_res_1 => usr_rd_res1,
    user_rd_res_2 => usr_rd_res2,
    user_rd_res_3 => usr_rd_res3,
    lane_rd_ptr_0 => lane_proc_rd0,
    lane_rd_ptr_1 => lane_proc_rd1,
    lane_rd_ptr_2 => lane_proc_rd2,
    lane_rd_ptr_3 => lane_proc_rd3,
    rd_0 => rd_0,
    rd_1 => rd_1,
    rd_2 => rd_2,
    rd_3 => rd_3,
    lane_wr_0 => lane_proc_wr0,
    lane_wr_1 => lane_proc_wr1,
    lane_wr_2 => lane_proc_wr2,
    lane_wr_3 => lane_proc_wr3,
    lane_en_rd_0 => lane_en_rd0,
    lane_en_rd_1 => lane_en_rd1,
    lane_en_rd_2 => lane_en_rd2,
    lane_en_rd_3 => lane_en_rd3,
    lane_en_wr_0 => lane_en_wr0,
    lane_en_wr_1 => lane_en_wr1,
    lane_en_wr_2 => lane_en_wr2,
    lane_en_wr_3 => lane_en_wr3
  );
  
  Inst_smart_arbiter: smart_arbiter PORT MAP(
    clk => clk,
    rst => rst,
    gnt => gnt,
    done => done,
    wr_size0 => wr_size0,
    rd_size0 => rd_size0,
    wr_size1 => wr_size1,
    rd_size1 => rd_size1,
    wr_size2 => wr_size2,
    rd_size2 => rd_size2,
    wr_size3 => wr_size3,
    rd_size3 => rd_size3,
    sel_lanes => sel_lane 
  );

   Inst_memory_interface: memory_interface PORT MAP(
    wr => wr_en_int,
    rd => rd_en_int,
    proc_IO => proc_int_bus,
    mem_IO1 => mem_int_bus1,
    mem_IO2 => mem_int_bus2,
    mem_IO3 => mem_int_bus3,
    mem_IO4 => mem_int_bus4,
    wr_response => wr_res,
    clk => clk,
    reset => rst
  );
  
  Inst_memory: memory PORT MAP(
    clk => clk2,
    wr_en => wr_en_mem,
    rd_en => rd_en_mem,
    ptr => ptr_to_mem,
    wr_response => wr_res,
    rd_response => rd_res,
    io_1 => mem_int_bus1,
    io_2 => mem_int_bus2,
    io_3 => mem_int_bus3,
    io_4 => mem_int_bus4,
	 reset => rst
  );


end Behavioral;
