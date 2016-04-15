-------------------------------------------------------------------------------
-- Title      : sha256core_wrapper
-- Project    : 
-------------------------------------------------------------------------------
-- File       : sha256core_wrapper.vhd
-- Author     :   <chrbi_000@SURFACE>
-- Company    : 
-- Created    : 2016-04-08
-- Last update: 2016-04-13
-- Platform   : 
-- Standard   : VHDL'08
-------------------------------------------------------------------------------
-- Description: Wrapper for core_top.vhd
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

entity sha256core_wrapper is
  port (
    clk_200mhz : in std_logic;
    reset_n    : in std_logic);
end entity sha256core_wrapper;

architecture str of sha256core_wrapper is
  constant c_msg_size : integer := 256;

  signal message : unsigned(c_msg_size-1 downto 0) := (others => '0');
  signal digest  : unsigned(255 downto 0)          := (others => '0');
begin

  i_sha256core_top : entity work.sha256core_top
    generic map (
      g_msg_size => c_msg_size)
    port map (
      clk_200mhz => clk_200mhz,
      reset    => reset_n,
      message    => message,
      digest     => digest);

end architecture str;
