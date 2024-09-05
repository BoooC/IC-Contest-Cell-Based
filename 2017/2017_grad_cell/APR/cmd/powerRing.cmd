clearGlobalNets
globalNetConnect VCC -type pgpin -pin VCC -instanceBasename *
globalNetConnect VCC -type net -net VCC
globalNetConnect VCC -type tiehi -pin VCC -instanceBasename *
globalNetConnect GND -type pgpin -pin GND -instanceBasename *
globalNetConnect GND -type net -net GND
globalNetConnect GND -type tielo -pin GND -instanceBasename *
#globalNetConnect GND -type pgpin -pin VSS -instanceBasename *

setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer METAL8 -stacked_via_bottom_layer METAL1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {GND VCC} -type core_rings -follow core -layer {top METAL3 bottom METAL3 left METAL2 right METAL2} -width {top 3.6 bottom 3.6 left 3.6 right 3.6} -spacing {top 0.24 bottom 0.24 left 0.24 right 0.24} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None -use_wire_group 1 -use_wire_group_bits 10 -use_interleaving_wire_group 1
# addRing -nets {GND VCC} -type core_rings -follow core -layer {top METAL5 bottom METAL5 left METAL4 right METAL4} -width {top 3.6 bottom 3.6 left 3.6 right 3.6} -spacing {top 0.24 bottom 0.24 left 0.24 right 0.24} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None -use_wire_group 1 -use_wire_group_bits 10 -use_interleaving_wire_group 1
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer METAL6 -stacked_via_bottom_layer METAL1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {GND VCC} -type block_rings -around each_block -layer {top METAL3 bottom METAL3 left METAL2 right METAL2} -width {top 2 bottom 2 left 2 right 2} -spacing {top 0.24 bottom 0.24 left 0.24 right 0.24} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

setSrouteMode -viaConnectToShape { ring }
sroute -connect { padPin } -layerChangeRange { METAL1(1) METAL6(6) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort allGeom } -padPinTarget { nearestTarget } -allowJogging 1 -crossoverViaLayerRange { METAL1(1) METAL6(6) } -nets { GND VCC } -allowLayerChange 1 -targetViaLayerRange { METAL1(1) METAL6(6) }