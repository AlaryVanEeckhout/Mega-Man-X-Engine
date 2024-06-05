// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_check_a_copy_shot(){
	if(key_shoot2 && !key_shoot && (current_weapon == noone || current_weapon == weapons.a_pistol) &&
	!using_special_weapon && !instance_exists(a_copy_shot_inst)){
		player_state_set(states.a_copy_shot, 0, [0]);
		using_special_weapon = true;
		player_state_a_copy_shot();
	}
	else if(using_special_weapon == true){
		player_shoot_pistol_animation();
		if(!instance_exists(a_copy_shot_inst)){
			player_weapon_select(weapons.a_pistol);
			using_special_weapon = false;
		}
	}
	else if(current_weapon == weapons.a_copy_shot){
		player_weapon_select(weapons.a_pistol);
	}
}