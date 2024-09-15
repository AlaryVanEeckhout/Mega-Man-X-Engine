event_inherited();
anti_destroy = true;
destroy_if_hit = false;
hit_only_once = false;
boss_buffer_limit = 8;
pass_through_walls = false;
wall_hit = false;
lv = 4;
atk = 8;
abs_hspeed = 0;


lazer_sections = ["Source", "Middle", "Hit"];
lazer_section = "Source";

animation_add("Source start",
[
	0, 3,
	15, 2,
	30, 1,
	45, 0,
]);

animation_add("Source loop",
[
	0, 0,
	2, 1,
	4, 1
], 0, 4);

animation_add("Source end",
[
	0, 0,
	5, 1,
	10, 2,
	15, 3,
	20, 3
]);

animation_add("Middle loop",
[
	0, 4,
	2, 5,
	4, 5
], 0, 4);

animation_add("Middle end",
[
	0, 4,
	5, 5,
	10, 6,
	15, 7,
	20, 7
]);

animation_add("Hit loop",
[
	0, 8,
	2, 9,
	4, 9
], 0, 4);

animation_add("Hit end",
[
	0, 8,
	5, 9,
	10, 10,
	15, 11,
	20, 12,
	25, 12
]);