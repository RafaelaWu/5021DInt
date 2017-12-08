set projDir "C:/Users/ibm/Documents/GitHub/5021D/work/planAhead"
set projName "Integrate1"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/mojo_top_0.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/reset_conditioner_1.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/reset_conditioner_1.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/reset_conditioner_1.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/state_4.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/multi_seven_seg_5.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/bcounter_6.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/reg8bit_7.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/main_8.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/alu_9.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/bintoAscii_10.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/counter_11.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/seven_seg_12.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/decoder_13.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/button_conditioner_14.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/button_conditioner_14.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/button_conditioner_14.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/counter_17.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/edge_detector_18.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/edge_detector_18.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/edge_detector_18.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/button_conditioner_14.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/button_conditioner_14.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/button_conditioner_14.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/counter_17.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/propogate_25.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/reg2bit_26.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/edge_detector_18.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/edge_detector_18.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/edge_detector_18.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/alu_9.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/pipeline_31.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/pipeline_31.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/pipeline_31.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/pipeline_31.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/pipeline_31.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/pipeline_31.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/counter_37.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/counter_38.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/counter_39.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/randomizer_40.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/counter_41.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/reg3bit_42.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/reg3bit_42.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/pn_gen_44.v" "C:/Users/ibm/Documents/GitHub/5021D/work/verilog/pn_gen_44.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/ibm/Documents/GitHub/5021D/constraint/io shield.ucf" "C:/Users/ibm/Documents/GitHub/5021D/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
