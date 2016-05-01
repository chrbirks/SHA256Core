-------------------------------------------------------------------------------
-- Title      : Testbench for design "sha256core_top"
-- Project    :
-------------------------------------------------------------------------------
-- File       : sha256core_top_tb.vhd
-- Author     :   <chrbi_000@SURFACE>
-- Company    :
-- Created    : 2016-04-08
-- Last update: 2016-05-01
-- Platform   :
-- Standard   : VHDL'08
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- Copyright (c) 2016
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016-04-08  1.0      chrbirks       Created
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
  constant c_msg_size : integer := 24;  --256;

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
    reset   <= '1';
    --digest_ready <= '0';
    message <= x"616263";               -- "abc"

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

    wait until digest_valid = '1';
    report "signal digest is " & integer'image(to_integer(digest));
--    report "      and ref is " & integer'image(to_integer(x"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"));
    assert digest = x"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad" report "Wrong digest!" severity failure;

    -- TODO: Test new message in next clock cycle
    --message <= x"636261"; -- "cba"
    -- TODO: assert that digest = 6d970874d0db767a7058798973f22cf6589601edab57996312f2ef7b56e5584d

    -- End testbench
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
