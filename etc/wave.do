onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sha256core_top_tb/DUT/clk
add wave -noupdate /sha256core_top_tb/DUT/reset
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/message
add wave -noupdate /sha256core_top_tb/DUT/message_valid
add wave -noupdate /sha256core_top_tb/DUT/message_ready
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/digest
add wave -noupdate /sha256core_top_tb/DUT/digest_valid
add wave -noupdate /sha256core_top_tb/DUT/digest_ready
add wave -noupdate /sha256core_top_tb/DUT/counter
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/w
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/a
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/b
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/c
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/d
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/e
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/f
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/g
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/h
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/T_1
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/T_2
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/H0
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/H1
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/H2
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/H3
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/H4
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/H5
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/H6
add wave -noupdate -radix hexadecimal /sha256core_top_tb/DUT/H7
add wave -noupdate -group digest_loop(0) /sha256core_top_tb/DUT/digest_loop(0)/i_digester/clk
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/w
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/a_in
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/b_in
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/c_in
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/d_in
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/e_in
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/f_in
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/g_in
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/h_in
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/T_1_in
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/T_2_in
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/a_out
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/b_out
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/c_out
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/d_out
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/e_out
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/f_out
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/g_out
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/h_out
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/T_1_out
add wave -noupdate -group digest_loop(0) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(0)/i_digester/T_2_out
add wave -noupdate -group digest_loop(1) /sha256core_top_tb/DUT/digest_loop(1)/i_digester/clk
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/w
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/a_in
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/b_in
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/c_in
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/d_in
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/e_in
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/f_in
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/g_in
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/h_in
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/T_1_in
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/T_2_in
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/a_out
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/b_out
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/c_out
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/d_out
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/e_out
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/f_out
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/g_out
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/h_out
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/T_1_out
add wave -noupdate -group digest_loop(1) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(1)/i_digester/T_2_out
add wave -noupdate -group digest_loop(2) /sha256core_top_tb/DUT/digest_loop(2)/i_digester/clk
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/w
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/a_in
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/b_in
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/c_in
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/d_in
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/e_in
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/f_in
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/g_in
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/h_in
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/T_1_in
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/T_2_in
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/a_out
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/b_out
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/c_out
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/d_out
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/e_out
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/f_out
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/g_out
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/h_out
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/T_1_out
add wave -noupdate -group digest_loop(2) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(2)/i_digester/T_2_out
add wave -noupdate -group digest_loop(15) /sha256core_top_tb/DUT/digest_loop(15)/i_digester/clk
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/w
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/a_in
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/b_in
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/c_in
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/d_in
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/e_in
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/f_in
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/g_in
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/h_in
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/T_1_in
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/T_2_in
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/a_out
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/b_out
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/c_out
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/d_out
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/e_out
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/f_out
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/g_out
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/h_out
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/T_1_out
add wave -noupdate -group digest_loop(15) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(15)/i_digester/T_2_out
add wave -noupdate -group digest_loop(16) /sha256core_top_tb/DUT/digest_loop(16)/i_digester/clk
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/w
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/a_in
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/b_in
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/c_in
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/d_in
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/e_in
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/f_in
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/g_in
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/h_in
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/T_1_in
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/T_2_in
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/a_out
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/b_out
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/c_out
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/d_out
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/e_out
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/f_out
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/g_out
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/h_out
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/T_1_out
add wave -noupdate -group digest_loop(16) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(16)/i_digester/T_2_out
add wave -noupdate -group digest_loop(17) /sha256core_top_tb/DUT/digest_loop(17)/i_digester/clk
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/w
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/a_in
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/b_in
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/c_in
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/d_in
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/e_in
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/f_in
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/g_in
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/h_in
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/T_1_in
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/T_2_in
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/a_out
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/b_out
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/c_out
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/d_out
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/e_out
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/f_out
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/g_out
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/h_out
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/T_1_out
add wave -noupdate -group digest_loop(17) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(17)/i_digester/T_2_out
add wave -noupdate -group digest_loop(63) /sha256core_top_tb/DUT/digest_loop(63)/i_digester/clk
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/w
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/a_in
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/b_in
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/c_in
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/d_in
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/e_in
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/f_in
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/g_in
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/h_in
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/T_1_in
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/T_2_in
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/a_out
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/b_out
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/c_out
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/d_out
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/e_out
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/f_out
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/g_out
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/h_out
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/T_1_out
add wave -noupdate -group digest_loop(63) -radix hexadecimal /sha256core_top_tb/DUT/digest_loop(63)/i_digester/T_2_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {335906 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 383
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {538125 ps}
