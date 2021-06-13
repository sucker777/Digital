-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Full Version"

-- DATE "06/13/2021 21:33:47"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Poker_Controller IS
    PORT (
	clk : IN std_logic;
	Switch : IN std_logic;
	P1_Roll : IN std_logic;
	P2_Roll : IN std_logic;
	Random_Seg : OUT std_logic_vector(0 TO 3)
	);
END Poker_Controller;

-- Design Ports Information
-- P2_Roll	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Random_Seg[3]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Random_Seg[2]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Random_Seg[1]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Random_Seg[0]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- P1_Roll	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Switch	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Poker_Controller IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_Switch : std_logic;
SIGNAL ww_P1_Roll : std_logic;
SIGNAL ww_P2_Roll : std_logic;
SIGNAL ww_Random_Seg : std_logic_vector(0 TO 3);
SIGNAL \P2_Roll~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \temp~1_combout\ : std_logic;
SIGNAL \Switch~input_o\ : std_logic;
SIGNAL \temp~2_combout\ : std_logic;
SIGNAL \temp~3_combout\ : std_logic;
SIGNAL \temp~0_combout\ : std_logic;
SIGNAL \Random_Seg[3]~0_combout\ : std_logic;
SIGNAL \P1_Roll~input_o\ : std_logic;
SIGNAL \Random_Seg[3]~reg0_q\ : std_logic;
SIGNAL \Random_Seg[2]~reg0_q\ : std_logic;
SIGNAL \Random_Seg[1]~reg0feeder_combout\ : std_logic;
SIGNAL \Random_Seg[1]~reg0_q\ : std_logic;
SIGNAL \Random_Seg[0]~reg0feeder_combout\ : std_logic;
SIGNAL \Random_Seg[0]~reg0_q\ : std_logic;
SIGNAL temp : std_logic_vector(0 TO 3);
SIGNAL ALT_INV_temp : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_Switch <= Switch;
ww_P1_Roll <= P1_Roll;
ww_P2_Roll <= P2_Roll;
Random_Seg <= ww_Random_Seg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
ALT_INV_temp(0) <= NOT temp(0);
ALT_INV_temp(1) <= NOT temp(1);
ALT_INV_temp(2) <= NOT temp(2);
ALT_INV_temp(3) <= NOT temp(3);

-- Location: IOOBUF_X60_Y0_N2
\Random_Seg[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Random_Seg[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_Random_Seg(3));

-- Location: IOOBUF_X60_Y0_N19
\Random_Seg[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Random_Seg[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_Random_Seg(2));

-- Location: IOOBUF_X58_Y0_N42
\Random_Seg[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Random_Seg[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_Random_Seg(1));

-- Location: IOOBUF_X60_Y0_N53
\Random_Seg[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Random_Seg[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_Random_Seg(0));

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: LABCELL_X60_Y1_N57
\temp~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~1_combout\ = ( temp(2) & ( temp(0) & ( temp(3) ) ) ) # ( !temp(2) & ( temp(0) & ( (!temp(1) & !temp(3)) ) ) ) # ( temp(2) & ( !temp(0) & ( temp(3) ) ) ) # ( !temp(2) & ( !temp(0) & ( !temp(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000000000001111111111110000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_temp(1),
	datad => ALT_INV_temp(3),
	datae => ALT_INV_temp(2),
	dataf => ALT_INV_temp(0),
	combout => \temp~1_combout\);

-- Location: IOIBUF_X62_Y0_N1
\Switch~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Switch,
	o => \Switch~input_o\);

-- Location: FF_X60_Y1_N59
\temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~1_combout\,
	ena => \Switch~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(2));

-- Location: LABCELL_X60_Y1_N12
\temp~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~2_combout\ = ( temp(1) & ( temp(0) & ( temp(3) ) ) ) # ( !temp(1) & ( temp(0) & ( (!temp(3) & temp(2)) ) ) ) # ( temp(1) & ( !temp(0) & ( (!temp(2)) # (temp(3)) ) ) ) # ( !temp(1) & ( !temp(0) & ( (!temp(3) & temp(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000111111110000111100000000111100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_temp(3),
	datad => ALT_INV_temp(2),
	datae => ALT_INV_temp(1),
	dataf => ALT_INV_temp(0),
	combout => \temp~2_combout\);

-- Location: FF_X60_Y1_N14
\temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~2_combout\,
	ena => \Switch~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(1));

-- Location: LABCELL_X60_Y1_N51
\temp~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~3_combout\ = ( temp(0) & ( temp(2) & ( (!temp(1)) # (temp(3)) ) ) ) # ( !temp(0) & ( temp(2) & ( (temp(1) & !temp(3)) ) ) ) # ( temp(0) & ( !temp(2) & ( (!temp(1)) # (temp(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111111100001111000000001111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_temp(1),
	datad => ALT_INV_temp(3),
	datae => ALT_INV_temp(0),
	dataf => ALT_INV_temp(2),
	combout => \temp~3_combout\);

-- Location: FF_X60_Y1_N53
\temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~3_combout\,
	ena => \Switch~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(0));

-- Location: LABCELL_X60_Y1_N18
\temp~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~0_combout\ = ( !temp(3) & ( temp(2) ) ) # ( !temp(3) & ( !temp(2) & ( (!temp(0)) # (!temp(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111110000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_temp(0),
	datad => ALT_INV_temp(1),
	datae => ALT_INV_temp(3),
	dataf => ALT_INV_temp(2),
	combout => \temp~0_combout\);

-- Location: FF_X60_Y1_N20
\temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~0_combout\,
	ena => \Switch~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(3));

-- Location: LABCELL_X60_Y1_N36
\Random_Seg[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Random_Seg[3]~0_combout\ = ( !temp(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_temp(3),
	combout => \Random_Seg[3]~0_combout\);

-- Location: IOIBUF_X60_Y0_N35
\P1_Roll~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_P1_Roll,
	o => \P1_Roll~input_o\);

-- Location: FF_X60_Y1_N38
\Random_Seg[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Random_Seg[3]~0_combout\,
	ena => \P1_Roll~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Random_Seg[3]~reg0_q\);

-- Location: FF_X60_Y1_N32
\Random_Seg[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => temp(2),
	sload => VCC,
	ena => \P1_Roll~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Random_Seg[2]~reg0_q\);

-- Location: LABCELL_X60_Y1_N27
\Random_Seg[1]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \Random_Seg[1]~reg0feeder_combout\ = ( temp(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_temp(1),
	combout => \Random_Seg[1]~reg0feeder_combout\);

-- Location: FF_X60_Y1_N28
\Random_Seg[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Random_Seg[1]~reg0feeder_combout\,
	ena => \P1_Roll~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Random_Seg[1]~reg0_q\);

-- Location: LABCELL_X60_Y1_N45
\Random_Seg[0]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \Random_Seg[0]~reg0feeder_combout\ = ( temp(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_temp(0),
	combout => \Random_Seg[0]~reg0feeder_combout\);

-- Location: FF_X60_Y1_N47
\Random_Seg[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Random_Seg[0]~reg0feeder_combout\,
	ena => \P1_Roll~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Random_Seg[0]~reg0_q\);

-- Location: IOIBUF_X52_Y81_N35
\P2_Roll~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_P2_Roll,
	o => \P2_Roll~input_o\);

-- Location: LABCELL_X40_Y48_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


