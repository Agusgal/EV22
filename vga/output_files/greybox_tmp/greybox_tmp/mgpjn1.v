//altsyncram ADDRESS_ACLR_B="NONE" ADDRESS_REG_B="CLOCK1" CBX_SINGLE_OUTPUT_FILE="ON" CLOCK_ENABLE_INPUT_A="BYPASS" CLOCK_ENABLE_INPUT_B="BYPASS" CLOCK_ENABLE_OUTPUT_B="BYPASS" INIT_FILE="image.mif" INIT_FILE_LAYOUT="PORT_B" INTENDED_DEVICE_FAMILY=""Cyclone IV E"" LPM_TYPE="altsyncram" NUMWORDS_A=65536 NUMWORDS_B=2796203 OPERATION_MODE="DUAL_PORT" OUTDATA_ACLR_B="NONE" OUTDATA_REG_B="CLOCK1" POWER_UP_UNINITIALIZED="FALSE" RDCONTROL_REG_B="CLOCK1" WIDTH_A=128 WIDTH_B=3 WIDTH_BYTEENA_A=1 WIDTH_BYTEENA_B=1 WIDTH_ECCSTATUS=3 WIDTHAD_A=16 WIDTHAD_B=22 address_a address_b clock0 clock1 data_a q_b rden_b wren_a
//VERSION_BEGIN 20.1 cbx_mgl 2020:06:05:12:11:10:SJ cbx_stratixii 2020:06:05:12:04:51:SJ cbx_util_mgl 2020:06:05:12:04:51:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2020  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and any partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details, at
//  https://fpgasoftware.intel.com/eula.



//synthesis_resources = altsyncram 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mgpjn1
	( 
	address_a,
	address_b,
	clock0,
	clock1,
	data_a,
	q_b,
	rden_b,
	wren_a) /* synthesis synthesis_clearbox=1 */;
	input   [15:0]  address_a;
	input   [21:0]  address_b;
	input   clock0;
	input   clock1;
	input   [127:0]  data_a;
	output   [2:0]  q_b;
	input   rden_b;
	input   wren_a;

	wire  [2:0]   wire_mgl_prim1_q_b;

	altsyncram   mgl_prim1
	( 
	.address_a(address_a),
	.address_b(address_b),
	.clock0(clock0),
	.clock1(clock1),
	.data_a(data_a),
	.q_b(wire_mgl_prim1_q_b),
	.rden_b(rden_b),
	.wren_a(wren_a));
	defparam
		mgl_prim1.address_aclr_b = "NONE",
		mgl_prim1.address_reg_b = "CLOCK1",
		mgl_prim1.clock_enable_input_a = "BYPASS",
		mgl_prim1.clock_enable_input_b = "BYPASS",
		mgl_prim1.clock_enable_output_b = "BYPASS",
		mgl_prim1.init_file = "image.mif",
		mgl_prim1.init_file_layout = "PORT_B",
		mgl_prim1.intended_device_family = ""Cyclone IV E"",
		mgl_prim1.lpm_type = "altsyncram",
		mgl_prim1.numwords_a = 65536,
		mgl_prim1.numwords_b = 2796203,
		mgl_prim1.operation_mode = "DUAL_PORT",
		mgl_prim1.outdata_aclr_b = "NONE",
		mgl_prim1.outdata_reg_b = "CLOCK1",
		mgl_prim1.power_up_uninitialized = "FALSE",
		mgl_prim1.rdcontrol_reg_b = "CLOCK1",
		mgl_prim1.width_a = 128,
		mgl_prim1.width_b = 3,
		mgl_prim1.width_byteena_a = 1,
		mgl_prim1.width_byteena_b = 1,
		mgl_prim1.width_eccstatus = 3,
		mgl_prim1.widthad_a = 16,
		mgl_prim1.widthad_b = 22;
	assign
		q_b = wire_mgl_prim1_q_b;
endmodule //mgpjn1
//VALID FILE
