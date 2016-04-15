-------------------------------------------------------------------------------
-- Title      : Testbench for design "sha256core_top"
-- Project    :
-------------------------------------------------------------------------------
-- File       : sha256core_top_tb.vhd
-- Author     :   <chrbi_000@SURFACE>
-- Company    :
-- Created    : 2016-04-08
-- Last update: 2016-04-13
-- Platform   :
-- Standard   : VHDL'93/02
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

-------------------------------------------------------------------------------

entity sha256core_top_tb is
end entity sha256core_top_tb;

-------------------------------------------------------------------------------

architecture bhv of sha256core_top_tb is

  -- constants
  constant c_200mhz_clk_period : time := 5 ns;

  -- component generics
  constant c_msg_size : integer := 256;

  -- component ports
  signal reset   : std_logic;
  signal message : unsigned(c_msg_size-1 downto 0);
  signal digest  : unsigned(255 downto 0);

  -- clock
  signal clk_200mhz_tb : std_logic := '1';

begin  -- architecture bhv

  -- component instantiation
  DUT : entity work.sha256core_top
    generic map (
      g_msg_size => c_msg_size)
    port map (
      clk_200mhz => clk_200mhz_tb,
      reset    => reset,
      message    => message,
      digest     => digest);

  -- clock generation
  clk_200mhz_tb <= not clk_200mhz_tb after c_200mhz_clk_period/2;

  -- waveform generation
  WaveGen_Proc : process
  begin
    -- insert signal assignments here
    reset <= '0';

    wait until clk_200mhz_tb = '1';
    message <= x"1111111111111111111111111111111111111111111111111111111111111F00";

    wait until clk_200mhz_tb = '1';
    wait for 10*c_200mhz_clk_period;

    report "Simulation finished" severity failure;
  end process WaveGen_Proc;



end architecture bhv;

-------------------------------------------------------------------------------

configuration sha256core_top_tb_bhv_cfg of sha256core_top_tb is
  for bhv
  end for;
end sha256core_top_tb_bhv_cfg;

-------------------------------------------------------------------------------
