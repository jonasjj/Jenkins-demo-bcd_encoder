open_proj bcd_encoder.xpr

set sim_fileset sim_1

launch_simulation -simset [get_filesets $sim_fileset]
close_sim

# Look for assertion failures in the simulation log
set log_file [glob *sim/$sim_fileset/behav/xsim/simulate.log]
set fp [open $log_file]
set file_data [read $fp]
exit [regex "Failure:" $file_data]