--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Sat Feb  1 18:49:13 2020
--Host        : CO2041-02 running 64-bit major release  (build 9200)
--Command     : generate_target zynq_design_1_wrapper.bd
--Design      : zynq_design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zynq_design_1_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    btns_5bits_tri_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    leds_8bits_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    locked : out STD_LOGIC;
    proc_clk : out STD_LOGIC_VECTOR ( 0 to 0 );
    sws_8bits_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tLast : out STD_LOGIC;
    tReady : out STD_LOGIC_VECTOR ( 0 to 0 );
    tUser : out STD_LOGIC_VECTOR ( 0 to 0 );
    tValid : out STD_LOGIC;
    vid_active : out STD_LOGIC;
    vid_b : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vid_g : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vid_hblank : out STD_LOGIC;
    vid_hsync : out STD_LOGIC;
    vid_overflow : out STD_LOGIC_VECTOR ( 0 to 0 );
    vid_r : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vid_underflow : out STD_LOGIC_VECTOR ( 0 to 0 );
    vid_vblank : out STD_LOGIC;
    vid_vsync : out STD_LOGIC;
    vtc_activeout : out STD_LOGIC_VECTOR ( 0 to 0 );
    vtc_clk : out STD_LOGIC_VECTOR ( 0 to 0 );
    vtc_hblank : out STD_LOGIC_VECTOR ( 0 to 0 );
    vtc_hsync : out STD_LOGIC_VECTOR ( 0 to 0 );
    vtc_vblank : out STD_LOGIC_VECTOR ( 0 to 0 );
    vtc_vsync : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end zynq_design_1_wrapper;

architecture STRUCTURE of zynq_design_1_wrapper is
  component zynq_design_1 is
  port (
    vid_active : out STD_LOGIC;
    vid_hblank : out STD_LOGIC;
    vid_hsync : out STD_LOGIC;
    vid_vblank : out STD_LOGIC;
    vid_vsync : out STD_LOGIC;
    vid_r : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vid_g : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vid_b : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vtc_activeout : out STD_LOGIC_VECTOR ( 0 to 0 );
    vtc_hblank : out STD_LOGIC_VECTOR ( 0 to 0 );
    vtc_hsync : out STD_LOGIC_VECTOR ( 0 to 0 );
    vtc_vblank : out STD_LOGIC_VECTOR ( 0 to 0 );
    vtc_vsync : out STD_LOGIC_VECTOR ( 0 to 0 );
    vtc_clk : out STD_LOGIC_VECTOR ( 0 to 0 );
    locked : out STD_LOGIC;
    tUser : out STD_LOGIC_VECTOR ( 0 to 0 );
    tValid : out STD_LOGIC;
    tLast : out STD_LOGIC;
    vid_overflow : out STD_LOGIC_VECTOR ( 0 to 0 );
    vid_underflow : out STD_LOGIC_VECTOR ( 0 to 0 );
    proc_clk : out STD_LOGIC_VECTOR ( 0 to 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    leds_8bits_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sws_8bits_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    btns_5bits_tri_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    tReady : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_design_1;
begin
zynq_design_1_i: component zynq_design_1
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      btns_5bits_tri_i(4 downto 0) => btns_5bits_tri_i(4 downto 0),
      leds_8bits_tri_o(7 downto 0) => leds_8bits_tri_o(7 downto 0),
      locked => locked,
      proc_clk(0) => proc_clk(0),
      sws_8bits_tri_i(7 downto 0) => sws_8bits_tri_i(7 downto 0),
      tLast => tLast,
      tReady(0) => tReady(0),
      tUser(0) => tUser(0),
      tValid => tValid,
      vid_active => vid_active,
      vid_b(3 downto 0) => vid_b(3 downto 0),
      vid_g(3 downto 0) => vid_g(3 downto 0),
      vid_hblank => vid_hblank,
      vid_hsync => vid_hsync,
      vid_overflow(0) => vid_overflow(0),
      vid_r(3 downto 0) => vid_r(3 downto 0),
      vid_underflow(0) => vid_underflow(0),
      vid_vblank => vid_vblank,
      vid_vsync => vid_vsync,
      vtc_activeout(0) => vtc_activeout(0),
      vtc_clk(0) => vtc_clk(0),
      vtc_hblank(0) => vtc_hblank(0),
      vtc_hsync(0) => vtc_hsync(0),
      vtc_vblank(0) => vtc_vblank(0),
      vtc_vsync(0) => vtc_vsync(0)
    );
end STRUCTURE;
