/// @description Reset player state
var _player_inst = instance_nearest(x, y, obj_player_parent);
if lazer_section == "Source" || (!_player_inst.shoot_enabled && instance_number(object_index) <= 1) {
	with(_player_inst){
		shoot_enabled = true;
		xscale = dir; // reset facing in case shot performed from wallslide
		player_check_fall();
		player_check_idle();
	}
}
event_inherited(); // Inherit the parent event