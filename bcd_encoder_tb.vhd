library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library pck_lib;
use pck_lib.types.all;
use pck_lib.sim.all;

library bcd_encoder_lib;

entity bcd_encoder_tb is
end bcd_encoder_tb; 

architecture sim of bcd_encoder_tb is

  signal value : value_type;
  signal digits : digits_type;

begin

  DUT : entity bcd_encoder_lib.bcd_encoder(rtl)
  port map (
    value => value,
    digits => digits
  );

  SEQUENCER_PROC : process
  begin
    wait for sim_clk_period * 2;

    for tens in 0 to 9 loop
      for ones in 0 to 9 loop
        
        value <= tens * 10 + ones;
        wait for 1 ns;

        report "Checking value = " & integer'image(value);

        assert digits = (tens, ones)
          report "digits is not (" & integer'image(tens) &
            ", " & integer'image(ones) & ")"
          severity failure;
      end loop;
    end loop;
    
    print_ok_and_finish;
  end process;

end architecture;