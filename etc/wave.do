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
add wave -noupdate /sha256core_top_tb/DUT/cur_state
add wave -noupdate /sha256core_top_tb/DUT/next_state
add wave -noupdate /sha256core_top_tb/DUT/digest_valid_int
add wave -noupdate /sha256core_top_tb/DUT/message_valid_array
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {617500 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 299
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1838152 ps}
