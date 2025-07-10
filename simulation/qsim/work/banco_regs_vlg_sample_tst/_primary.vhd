library verilog;
use verilog.vl_types.all;
entity banco_regs_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        ra1             : in     vl_logic_vector(2 downto 0);
        ra2             : in     vl_logic_vector(2 downto 0);
        rst             : in     vl_logic;
        wa3             : in     vl_logic_vector(2 downto 0);
        wd3             : in     vl_logic_vector(7 downto 0);
        we3             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end banco_regs_vlg_sample_tst;
