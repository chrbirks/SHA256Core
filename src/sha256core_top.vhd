-------------------------------------------------------------------------------
-- Title      : sha256core_top
-- Project    :
-------------------------------------------------------------------------------
-- File       : sha256core_top.vhd
-- Author     :   <chrbi_000@SURFACE>
-- Company    :
-- Created    : 2016-04-08
-- Last update: 2016-04-13
-- Platform   :
-- Standard   : VHDL'08
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- Copyright (c) 2016
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016-04-08  1.0      chrbi_000       Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sha256core_top is
  generic (
    g_msg_size : integer := 256);
  port (
    clk_200mhz   : in  std_logic;
    reset        : in  std_logic;
    --
    message      : in  unsigned(g_msg_size-1 downto 0);
    digest       : out unsigned(255 downto 0);
    digest_ready : out std_logic);
end entity sha256core_top;

architecture str of sha256core_top is
  constant c_block_size  : integer                                                    := 512;
  constant c_length_size : integer                                                    := 64;
  constant c_zeros       : unsigned(c_block_size-g_msg_size-c_length_size-2 downto 0) := (others => '0');

  type t_fsm_state is (s0, s1, s2);
  signal cur_state  : t_fsm_state;
  signal next_state : t_fsm_state;

  signal H_1 : unsigned(31 downto 0) := x"6A09E667";
  signal H_2 : unsigned(31 downto 0) := x"BB67AE85";
  signal H_3 : unsigned(31 downto 0) := x"3C6EF372";
  signal H_4 : unsigned(31 downto 0) := x"A54FF53A";
  signal H_5 : unsigned(31 downto 0) := x"510E527F";
  signal H_6 : unsigned(31 downto 0) := x"9B05688C";
  signal H_7 : unsigned(31 downto 0) := x"1F83D9AB";
  signal H_8 : unsigned(31 downto 0) := x"5BE0CD19";

                                        --signal reset : std_logic;
  signal message_zero_padded   : unsigned(c_block_size-1 downto 0) := (others => '0');
  signal message_length_padded : unsigned(c_block_size-1 downto 0) := (others => '0');
begin

  assert g_msg_size < 447 report "Input message wrong length" severity failure;

  p_main : process(clk_200mhz) is
  begin
    if (rising_edge(clk_200mhz)) then

      cur_state <= next_state;



      if (reset = '1') then
         cur_state <= s0;
      end if;
    --
    end if;
  end process p_main;

  p_fsm : process(cur_state)
  begin
    case cur_state is
      when s0 =>
        -- wait for valid input

       -- Pad message
       message_zero_padded <= message & '1' & c_zeros & to_unsigned(g_msg_size, c_length_size);
 --    message_length_padded <= message_zero_padded and to_unsigned(g_msg_size, c_length_size);

        next_state <= s1;
      when s1 =>
        next_state <= s2;
      when s2 =>
        -- assert output valid
        next_state <= s0;
    -- TODO: when others?
    end case;
  end process p_fsm;

end architecture str;
