puts "Flow-Info: Running script [info script]\n"

source hier_rp_groups.tcl

add_tap_cell_array -master_cell_name TAPCELLBWP -pattern stagger_every_other_row -distance 40 -tap_cell_identifier {subcnt} -tap_cell_separator {_} -respect_keepout

set physopt_new_fix_constants true
set tie_cells [get_lib_cells */* -filter "name=~TIE*"]
remove_attribute $tie_cells dont_use
remove_attribute $tie_cells dont_touch
set_attribute [get_lib_pins -of_objects $tie_cells] max_fanout 8

set_lib_cell_spacing_label -names {X} -left_lib_cells [get_physical_lib_cells -filter "mask_layout_type==std"] -right_lib_cells [get_physical_lib_cells -filter "mask_layout_type==std"]
set_spacing_label_rule -labels {X X} {1 1}

puts "Flow-Info: Completed script [info script]\n"
