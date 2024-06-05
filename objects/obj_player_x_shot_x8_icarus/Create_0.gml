event_inherited();

lv = 4;
atk = 8;
abs_hspeed = 0;


lazer_sections = ["Source", "Middle", "Hit"];
lazer_section = "Source";

animation_add("Source start",
[
	3, 2,
	1, 0,
], 0, 3);

animation_add("Source loop",
[
	0, 1,
], 0, 3);

animation_add("Source end",
[
	0, 1,
	2, 3,
], 0);

animation_add("Middle loop",
[
	4, 5,
], 0);

animation_add("Middle end",
[
	4, 5,
	6, 7,
], 0);

animation_add("Hit loop",
[
	8, 9,
], 0);

animation_add("Hit end",
[
	8, 9,
	10, 11,
	12,
], 0);