
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name piano -dir "E:/test/piano15NN/planAhead_run_2" -part xc3s100ecp132-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/test/piano15NN/digital_piano.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/test/piano15NN} }
set_property target_constrs_file "digital_piano_ucf.ucf" [current_fileset -constrset]
add_files [list {digital_piano_ucf.ucf}] -fileset [get_property constrset [current_run]]
link_design
