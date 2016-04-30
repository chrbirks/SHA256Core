-------------------------------------------------------------------------------
-- Title      : sha256core_top
-- Project    :
-------------------------------------------------------------------------------
-- File       : sha256core_top.vhd
-- Author     :   <chrbi_000@SURFACE>
-- Company    :
-- Created    : 2016-04-08
-- Last update: 2016-04-24
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
    clk           : in  std_logic;
    reset         : in  std_logic;
    --
    message       : in  unsigned(g_msg_size-1 downto 0);
    message_valid : in  std_logic;
    message_ready : out std_logic;
    --
    digest        : out unsigned(255 downto 0);
    digest_valid  : out std_logic;
    digest_ready  : in  std_logic);
end entity sha256core_top;

architecture str of sha256core_top is
  constant c_block_size  : integer                                                    := 512;
  constant c_length_size : integer                                                    := 64;
  constant c_zeros       : unsigned(c_block_size-g_msg_size-c_length_size-2 downto 0) := (others => '0');

  constant c_H0 : unsigned(31 downto 0) := x"6A09E667";
  constant c_H1 : unsigned(31 downto 0) := x"BB67AE85";
  constant c_H2 : unsigned(31 downto 0) := x"3C6EF372";
  constant c_H3 : unsigned(31 downto 0) := x"A54FF53A";
  constant c_H4 : unsigned(31 downto 0) := x"510E527F";
  constant c_H5 : unsigned(31 downto 0) := x"9B05688C";
  constant c_H6 : unsigned(31 downto 0) := x"1F83D9AB";
  constant c_H7 : unsigned(31 downto 0) := x"5BE0CD19";

  type t_word_array is array (0 to 63) of unsigned(31 downto 0);
  constant c_K : t_word_array :=
    (0  => x"428a2f98",
     1  => x"71374491",
     2  => x"b5c0fbcf",
     3  => x"e9b5dba5",
     4  => x"3956c25b",
     5  => x"59f111f1",
     6  => x"923f82a4",
     7  => x"ab1c5ed5",
     8  => x"d807aa98",
     9  => x"12835b01",
     10 => x"243185be",
     11 => x"550c7dc3",
     12 => x"72be5d74",
     13 => x"80deb1fe",
     14 => x"9bdc06a7",
     15 => x"c19bf174",
     16 => x"e49b69c1",
     17 => x"efbe4786",
     18 => x"0fc19dc6",
     19 => x"240ca1cc",
     20 => x"2de92c6f",
     21 => x"4a7484aa",
     22 => x"5cb0a9dc",
     23 => x"76f988da",
     24 => x"983e5152",
     25 => x"a831c66d",
     26 => x"b00327c8",
     27 => x"bf597fc7",
     28 => x"c6e00bf3",
     29 => x"d5a79147",
     30 => x"06ca6351",
     31 => x"14292967",
     32 => x"27b70a85",
     33 => x"2e1b2138",
     34 => x"4d2c6dfc",
     35 => x"53380d13",
     36 => x"650a7354",
     37 => x"766a0abb",
     38 => x"81c2c92e",
     39 => x"92722c85",
     40 => x"a2bfe8a1",
     41 => x"a81a664b",
     42 => x"c24b8b70",
     43 => x"c76c51a3",
     44 => x"d192e819",
     45 => x"d6990624",
     46 => x"f40e3585",
     47 => x"106aa070",
     48 => x"19a4c116",
     49 => x"1e376c08",
     50 => x"2748774c",
     51 => x"34b0bcb5",
     52 => x"391c0cb3",
     53 => x"4ed8aa4a",
     54 => x"5b9cca4f",
     55 => x"682e6ff3",
     56 => x"748f82ee",
     57 => x"78a5636f",
     58 => x"84c87814",
     59 => x"8cc70208",
     60 => x"90befffa",
     61 => x"a4506ceb",
     62 => x"bef9a3f7",
     63 => x"c67178f2");

  type t_fsm_state is (s_init, s_1, s_2);
  signal cur_state  : t_fsm_state;
  signal next_state : t_fsm_state;

  signal counter : integer range 0 to 700;

                                        --signal reset : std_logic;
  --signal message_zero_padded   : unsigned(c_block_size-1 downto 0) := (others => '0');
  --signal message_length_padded : unsigned(c_block_size-1 downto 0) := (others => '0');

  
  signal w : t_word_array := (others => (others => '0'));

  type t_working_word_array is array (0 to 64) of unsigned(31 downto 0);
  signal a                              : t_working_word_array  := (0      => c_h0, others => (others => '0'));
  signal b                              : t_working_word_array  := (0      => c_h1, others => (others => '0'));
  signal c                              : t_working_word_array  := (0      => c_h2, others => (others => '0'));
  signal d                              : t_working_word_array  := (0      => c_h3, others => (others => '0'));
  signal e                              : t_working_word_array  := (0      => c_h4, others => (others => '0'));
  signal f                              : t_working_word_array  := (0      => c_h5, others => (others => '0'));
  signal g                              : t_working_word_array  := (0      => c_h6, others => (others => '0'));
  signal h                              : t_working_word_array  := (0      => c_h7, others => (others => '0'));
  signal T_1, T_2                       : t_working_word_array  := (others => (others => '0'));
  signal H0, H1, H2, H3, H4, H5, H6, H7 : unsigned(31 downto 0) := (others => '0');

  function sigma_0_lower (
    x : unsigned(31 downto 0))
    return unsigned is
  begin
    return rotate_right(x, 7) xor rotate_right(x, 18) xor shift_right(x, 3);
  end sigma_0_lower;

  function sigma_1_lower (
    x : unsigned(31 downto 0))
    return unsigned is
  begin
    return rotate_right(x, 17) xor rotate_right(x, 19) xor shift_right(x, 10);
  end sigma_1_lower;

  --function sigma_0_upper (
  --  x : unsigned(31 downto 0))
  --  return unsigned is
  --begin
  --  return rotate_right(x, 2) xor rotate_right(x, 13) xor rotate_right(x, 22);
  --end sigma_0_upper;

  --function sigma_1_upper (
  --  x : unsigned(31 downto 0))
  --  return unsigned is
  --begin
  --  return rotate_right(x, 6) xor rotate_right(x, 11) xor rotate_right(x, 25);
  --end sigma_1_upper;

  --function Ch (
  --  x, y, z : unsigned(31 downto 0))
  --  return unsigned is
  --begin
  --  return (x and y) or ((not x) and z);
  --end Ch;

  --function Maj (
  --  x, y, z : unsigned(31 downto 0))
  --  return unsigned is
  --begin
  --  return (x and y) or (x and z) or (y and z);
  --end Maj;


begin

  assert g_msg_size < 447 report "Input message wrong length" severity failure;

  p_state_memory : process(clk) is
  begin
    if (rising_edge(clk)) then

      cur_state <= next_state;
      counter   <= counter + 1;

      if (reset = '1') then
        cur_state <= s_init;
        counter   <= 0;
      end if;
    --
    end if;
  end process p_state_memory;

  p_state_logic : process(cur_state, message_valid)
  begin
    case cur_state is
      when s_init =>
        if message_valid = '1' then
          next_state <= s_1;
        else
          next_state <= s_init;
        end if;
      when s_1 =>
        if (counter = 70) then
          next_state <= s_2;
        else
          next_state <= s_1;
        end if;
      when s_2 =>
        next_state <= s_init;
      when others =>
        next_state <= s_init;
    end case;
  end process p_state_logic;

  digest_loop : for i in 0 to 63 generate
  begin
    i_digester : entity work.digester
      generic map (
        K => c_K(i))
      port map (
        clk     => clk,
        w       => w(i),
        a_in    => a(i),
        b_in    => b(i),
        c_in    => c(i),
        d_in    => d(i),
        e_in    => e(i),
        f_in    => f(i),
        g_in    => g(i),
        h_in    => h(i),
        T_1_in  => T_1(i),
        T_2_in  => T_2(i),
        a_out   => a(i+1),
        b_out   => b(i+1),
        c_out   => c(i+1),
        d_out   => d(i+1),
        e_out   => e(i+1),
        f_out   => f(i+1),
        g_out   => g(i+1),
        h_out   => h(i+1),
        T_1_out => T_1(i+1),
        T_2_out => T_2(i+1));
  end generate digest_loop;

  p_hash : process(clk) is
    variable message_zero_padded : unsigned(c_block_size-1 downto 0) := (others => '0');
  begin
    if (rising_edge(clk)) then

      -- Cycle 1: Pad message
      message_zero_padded := message & '1' & c_zeros & to_unsigned(g_msg_size, c_length_size);

      -- Cycle 1: Prepare message schedule
      for t in 0 to 15 loop
        --w(t) := message_zero_padded(t*32+31 downto t*32); -- FIXME: reverse endianess
        w(t) <= message_zero_padded(message_zero_padded'left - t*32 downto message_zero_padded'left - t*32 - 31);
      end loop;
      for t in 16 to 63 loop
        w(t) <= sigma_1_lower(w(t-2) + w(t-7) + sigma_0_lower(w(t-15)) + w(t-16));
      end loop;

      -- Cycle 1: Assign working variables
--      a <= c_H0;
--      b <= c_H1;
--      c <= c_H2;
--      d <= c_H3;
--      e <= c_H4;
--      f <= c_H5;
--      g <= c_H6;
--      h <= c_H7;

      -- For t = 0..63
      -- FIXME: must be done in clock cycle 2..2+64
      --for t in 0 to 63 loop
      --T_1 <= h + sigma_1_upper(e) + Ch(e, f, g) + c_K(t) + w(t);
      --T_2 <= sigma_0_upper(a) + Maj(a, b, c);
      --h   <= g;
      --g   <= f;
      --f   <= e;
      --e   <= d + T_1;
      --d   <= c;
      --c   <= b;
      --b   <= a;
      --a   <= T_1 + T_2;
      --end loop;



      -- Cycle 67(?): Compute the intermediate hash value
      H0 <= a(63) + c_H0;
      H1 <= b(63) + c_H1;
      H2 <= c(63) + c_H2;
      H3 <= d(63) + c_H3;
      H4 <= e(63) + c_H4;
      H5 <= f(63) + c_H5;
      H6 <= g(63) + c_H6;
      H7 <= h(63) + c_H7;

      -- Cycle 5: Concatenate the digest
      digest       <= H0 & H1 & H2 & H3 & H4 & H5 & H6 & H7;
      digest_valid <= '1';

      if (reset = '1') then
        message_zero_padded := (others => '0');
        w                   <= (others => (others => '0'));

        H0 <= c_H0;
        H1 <= c_H1;
        H2 <= c_H2;
        H3 <= c_H3;
        H4 <= c_H4;
        H5 <= c_H5;
        H6 <= c_H6;
        H7 <= c_H7;
      end if;
    end if;

  end process p_hash;

end architecture str;
