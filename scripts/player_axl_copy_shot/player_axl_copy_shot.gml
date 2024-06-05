// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_axl_copy_shot(lvl = -1, t = 0) {
	shoot_limit = 1;
	shoot_animation = "";
	shoot_type = shoot_types.normal;
	shoot_wait = true;
	shoot_direction_index = player_get_aim_direction();

	player_shoot_pistol_animation();
	a_copy_shot_inst = player_shoot_projectile(obj_player_axl_copy_shot, true);
	shot_id = 0;
}