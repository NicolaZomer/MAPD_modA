#Buttons
set_property -dict { PACKAGE_PIN D9      IOSTANDARD LVCMOS33 } [get_ports { a_in }]; #I0_L6N_T0_VREF_16 Sch=btn[0]
set_property -dict { PACKAGE_PIN C9      IOSTANDARD LVCMOS33 } [get_ports { b_in }]; #I0_L11P_T1_SRCC_16 Sch=btn[1]
set_property -dict { PACKAGE_PIN B9     IOSTANDARD LVCMOS33 } [get_ports { c_in }]; #I0_L11N_T1_SRCC_16 Sch=btn[2]
set_property -dict { PACKAGE_PIN B8     IOSTANDARD LVCMOS33 } [get_ports { d_in }]; #I0_L12P_T1_MRCC_16 Sch=btn[3]


#Switches
set_property -dict { PACKAGE_PIN A8      IOSTANDARD LVCMOS33 } [get_ports { sel_in[0] }]; #I0_L12N_T1_MRCC_16 Sch=sw[0]
set_property -dict { PACKAGE_PIN C11     IOSTANDARD LVCMOS33 } [get_ports { sel_in[1] }]; #I0_L13P_T2_MRCC_16 Sch=sw[1]

#RGB_LEDs
set_property -dict { PACKAGE_PIN E1      IOSTANDARD LVCMOS33 } [get_ports { y_out }]; #I0_L18_T2_35 Sch=led0_b