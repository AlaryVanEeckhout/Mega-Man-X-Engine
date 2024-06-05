/// @description Lazer animation handling
// You can write your code in this editor







// Inherit the parent event
event_inherited();

if (G.paused)// don't allow timer to augment when paused
	return;
var t = timer++;

if (t == 0)
{
	var inst = instance_create_depth(x, y, depth, obj_player_x_shot_ult_effect);
	inst.image_xscale = dir;
	abs_hspeed = 25;
}
else
	abs_hspeed = 0;


if (lazer_section == "Source"){
	if (t == 1)
	{
		animation_play("Source start");
	}
	if (t == 5)
	{
		animation_play("Source loop");
	}
}
else{
	if (t == 1)
	{
		animation_play("Middle loop");
		abs_hspeed = 2;
	}

	if (t == 8)
	{
		abs_hspeed += 10;
	}
	if (t < 8)
	{
		player_shot_pos_fix();	
	}
	else
	{
		abs_hspeed += 0.5;
		abs_hspeed = min(abs_hspeed, 7);
	}
}


if (t >= 240){
	abs_hspeed = 1200; // de-spawn shot
	with(obj_player_parent){
		//
	}
}
else if (t >= 60){
	if (lazer_section == "Source"){
		animation_play("Source end");
	}
	else if (lazer_section == "Middle"){
		animation_play("Middle end");
	}
	else if (lazer_section == "Hit"){
		animation_play("Hit end");
	}
}
else{
	with(obj_player_parent){
		//
	}
}


h_speed = abs_hspeed * dir;