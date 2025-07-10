library verilog;
use verilog.vl_types.all;
entity banco_regs_vlg_check_tst is
    port(
        rd1             : in     vl_logic_vector(7 downto 0);
        rd2             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end banco_regs_vlg_check_tst;
