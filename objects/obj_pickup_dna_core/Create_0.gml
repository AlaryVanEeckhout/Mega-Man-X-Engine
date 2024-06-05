event_inherited();
animation_add("L", [
	0, 0,
	2, 1,
	4, 2,
	6, 1,
	7, 1
], 0, 7);
animation_play("L");
time_per_unit = 1;
pickup_type = pickup_types.dna_core;