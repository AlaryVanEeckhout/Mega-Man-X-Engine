/// @description Lazer animation handling
// You can write your code in this editor
PAUSE





// Inherit the parent event
event_inherited();
var _player_inst = instance_nearest(x, y, obj_player_parent);
var t = timer++;
if (t == 0 && lazer_section == "Source")
{
	var inst = instance_create_depth(x, y, depth, obj_player_x_shot_ult_effect);
	inst.image_xscale = dir;
}


if (lazer_section == "Source"){
	if (t == 1)
	{
		animation_play("Source start");
		var _middle_inst = noone;
		with(_player_inst){
			_middle_inst = player_shoot_projectile(obj_player_x_shot_x8_icarus);
		};
		_middle_inst.lazer_section = "Middle";
		_middle_inst.x += sprite_width;
		_middle_inst.timer = timer
		with (_middle_inst) {animation_play("Middle loop");}
	}
	if (t == 5)
	{
		animation_play("Source loop");
	}
}
else if (lazer_section == "Middle"){
	if !pass_through_walls && !is_place_free(x, y) && wall_hit == false {
		var _hit_inst = noone;
		with(_player_inst){
			_hit_inst = player_shoot_projectile(obj_player_x_shot_x8_icarus);
		};
		_hit_inst.lazer_section = "Hit";
		_hit_inst.x += sprite_width;
		image_xscale = clamp(abs(image_xscale), 0, abs(image_xscale)-1)*sign(image_xscale); // remove tip of beam to replace with hit
		_hit_inst.timer = timer;
		with (_hit_inst) {animation_play("Hit loop");}
		wall_hit = true;
	}
} else {
	// Hit loop
}
if (animation_end && t > 60){
	instance_destroy(); // de-spawn shot
}
else{
	if (t >= 60){
		animation_play(lazer_section + " end"); // end anim befor despawn
	}
	if is_inside_view() { // don't lock player in state if shot cannot spawn
		with(_player_inst){
			state_set(states.grabbed);
			if animation == "idle"
				animation_play("shoot");
			else if !string_pos("shoot", animation)
				animation_play(animation + "_shoot");
			shoot_enabled = false;
		}
	}
}

//h_speed = abs_hspeed * dir;