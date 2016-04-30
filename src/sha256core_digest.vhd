-------------------------------------------------------------------------------
-- Title      : sha256core_digest
-- Project    : 
-------------------------------------------------------------------------------
-- File       : sha256core_digest.vhd
-- Author     :   <chrbirks@CHRBIRKS-PC>
-- Company    : 
-- Created    : 2016-04-24
-- Last update: 2016-04-24
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2016 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016-04-24  1.0      chrbirks        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity digester is
  generic (
    k : unsigned(31 downto 0));
  port (
    clk     : in  std_logic;
    w       : in  unsigned(31 downto 0);
    a_in    : in  unsigned(31 downto 0);
    b_in    : in  unsigned(31 downto 0);
    c_in    : in  unsigned(31 downto 0);
    d_in    : in  unsigned(31 downto 0);
    e_in    : in  unsigned(31 downto 0);
    f_in    : in  unsigned(31 downto 0);
    g_in    : in  unsigned(31 downto 0);
    h_in    : in  unsigned(31 downto 0);
    T_1_in  : in  unsigned(31 downto 0);
    T_2_in  : in  unsigned(31 downto 0);
    a_out   : out unsigned(31 downto 0);
    b_out   : out unsigned(31 downto 0);
    c_out   : out unsigned(31 downto 0);
    d_out   : out unsigned(31 downto 0);
    e_out   : out unsigned(31 downto 0);
    f_out   : out unsigned(31 downto 0);
    g_out   : out unsigned(31 downto 0);
    h_out   : out unsigned(31 downto 0);
    T_1_out : out unsigned(31 downto 0);
    T_2_out : out unsigned(31 downto 0));
end entity digester;

architecture rtl of digester is

  function sigma_0_upper (
    x : unsigned(31 downto 0))
    return unsigned is
  begin
    return rotate_right(x, 2) xor rotate_right(x, 13) xor rotate_right(x, 22);
  end sigma_0_upper;

  function sigma_1_upper (
    x : unsigned(31 downto 0))
    return unsigned is
  begin
    return rotate_right(x, 6) xor rotate_right(x, 11) xor rotate_right(x, 25);
  end sigma_1_upper;

  function Ch (
    x, y, z : unsigned(31 downto 0))
    return unsigned is
  begin
    return (x and y) or ((not x) and z);
  end Ch;

  function Maj (
    x, y, z : unsigned(31 downto 0))
    return unsigned is
  begin
    return (x and y) or (x and z) or (y and z);
  end Maj;

begin

  process(clk) is
  begin
    if (rising_edge(clk)) then
      T_1_out <= h_in + sigma_1_upper(e_in) + Ch(e_in, f_in, g_in) + K + w;
      T_2_out <= sigma_0_upper(a_in) + Maj(a_in, b_in, c_in);
      h_out   <= g_in;
      g_out   <= f_in;
      f_out   <= e_in;
      e_out   <= d_in + T_1_in;
      d_out   <= c_in;
      c_out   <= b_in;
      b_out   <= a_in;
      a_out   <= T_1_in + T_2_in;
    end if;
  end process;

end rtl;
