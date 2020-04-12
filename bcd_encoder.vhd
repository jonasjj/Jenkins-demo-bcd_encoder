library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library pck_lib;
use pck_lib.types.all;

entity bcd_encoder is
  port (
    value : in value_type;
    digits : out digits_type
  );
end bcd_encoder;

architecture rtl of bcd_encoder is

begin

    -- Convert to BCD
    digits(1) <= value / 10;
    digits(0) <= value - ((value / 10) * 10);

end architecture;