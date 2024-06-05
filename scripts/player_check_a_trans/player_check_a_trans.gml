// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_check_a_trans(){
	var _original_body = global.character_selected[0];
	if(!a_trans){
		if(key_special && !using_special_weapon
		&& a_trans_body != obj_player_parent){
			player_state_set(states.a_trans, 0, [0]);
			a_trans = true;
			//using_special_weapon = true;
			player_state_a_trans(a_trans_body);
		}
	}
	else{
		if(key_special){
			log("a_trans State Exited");
			//using_special_weapon = false;
			instance_change(_original_body, false);
			state_unlocked[states.a_trans] = false;
			a_trans = false
			player_check_idle();
			player_check_fall();
		}
	}
}