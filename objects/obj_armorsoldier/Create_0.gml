event_inherited();
hp = 3;
collide_damage = 2;
abs_hspeed = 2;
face_x = false;
ride_inst = noone;
ride_char_pos = { x: 0, y: 0 };
move = 0;
#region Animations
// Look
animation_add("L",
[
	5, 0, 
	20, 1,
	25, 2,
	30, 3,
	45, 2,
	40, 1
]);
// Look near
animation_add("L2",
[
	0, 0
]);
// Jump
animation_add("J",
[
	0, 4
]);
// Ride
animation_add("ride_armor",
[
	8, 5,
	16, 6,
	24, 7,
	32, 6
]);
animation_play("L");
#endregion