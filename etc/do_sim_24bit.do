vlib rtl_work
vmap work rtl_work

# vlog -vlog01compat -work work +incdir+I:/Dropbox/Projekter/FPGA/SHA256Core/quartus/db {I:/Dropbox/Projekter/FPGA/SHA256Core/quartus/db/pll_altpll.v}
# vlog -reportprogress 300 -vlog01compat -work work "+incdir+I:/Dropbox/Projekter/FPGA/SHA256Core/quartus/db" I:/Dropbox/Projekter/FPGA/SHA256Core/quartus/db/pll_altpll.v 

vcom -reportprogress 300 -work work I:/Dropbox/Projekter/FPGA/SHA256Core/src/package_sha256_common.vhd
vcom -reportprogress 300 -work work I:/Dropbox/Projekter/FPGA/SHA256Core/src/sha256core_digest.vhd
vcom -reportprogress 300 -work work I:/Dropbox/Projekter/FPGA/SHA256Core/src/sha256core_top.vhd
vcom -reportprogress 300 -work work I:/Dropbox/Projekter/FPGA/SHA256Core/test/src/sha256core_top_24bit_tb.vhd

vsim work.sha256core_top_24bit_tb

restart -f
run -all