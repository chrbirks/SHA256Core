-------------------------------------------------------------------------------
-- Title      : Testbench for design "sha256core_top"
-- Project    :
-------------------------------------------------------------------------------
-- File       : sha256core_top_tb.vhd
-- Author     :   <chrbi_000@SURFACE>
-- Company    :
-- Created    : 2016-04-08
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
  constant c_msg_size : integer := 24;--256;

  -- component ports
  signal reset         : std_logic;
  signal message       : unsigned(c_msg_size-1 downto 0) := (others => '0');
  signal message_valid : std_logic                       := '0';
  signal message_ready : std_logic;
  signal digest        : unsigned(255 downto 0);
  signal digest_valid  : std_logic;
  signal digest_ready  : std_logic                       := '0';

  -- clock
  signal clk_200mhz_tb : std_logic := '0';

begin  -- architecture bhv

  -- component instantiation
  DUT : entity work.sha256core_top
    generic map (
      g_msg_size => c_msg_size)
    port map (
      clk           => clk_200mhz_tb,   -- in
      reset         => reset,           -- in
      message       => message,         -- in
      message_valid => message_valid,   -- in
      message_ready => message_ready,   -- out
      digest        => digest,          -- out
      digest_valid  => digest_valid,    -- out
      digest_ready  => digest_ready);   -- in

  -- clock generation
  clk_200mhz_tb <= not clk_200mhz_tb after c_200mhz_clk_period/2;

  -- waveform generation
  WaveGen_Proc : process
  begin
    -- insert signal assignments here
    reset        <= '1';
    digest_ready <= '0';
    --message <= x"0632A8F7E9766AB17677200AA307A5BCBBC459C7A9DDC87175C1FAD78FA46571"; -- Random
    message <= x"616263"; -- "abc"

    wait until clk_200mhz_tb = '1';
    reset <= '0';

    wait until clk_200mhz_tb = '1';
    if (message_ready = '0') then
      wait until clk_200mhz_tb = '1' and message_ready = '1';
    end if;

    message_valid <= '1';
    digest_ready  <= '1';

    wait until clk_200mhz_tb = '1';
    message_valid <= '0';

    --wait until clk_200mhz_tb = '1';
    wait for 100*c_200mhz_clk_period;

    report "Simulation finished" severity failure;
  end process WaveGen_Proc;



end architecture bhv;

-------------------------------------------------------------------------------

configuration sha256core_top_tb_bhv_cfg of sha256core_top_tb is
  for bhv
  end for;
end sha256core_top_tb_bhv_cfg;

-------------------------------------------------------------------------------
