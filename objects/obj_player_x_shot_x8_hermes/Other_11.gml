/// @description Play animation
// Inherit the parent event
event_inherited();
var t = timer++;
if (t >= 6) animation_play("L");
image_angle = dir_angle;
if image_xscale < 0 // fix side effects of using dir_angle as reference
	image_angle -= 2*image_angle;