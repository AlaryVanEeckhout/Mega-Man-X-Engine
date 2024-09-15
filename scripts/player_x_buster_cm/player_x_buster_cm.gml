function player_x_buster_cm(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;
	shoot_animation = "";
	var _t_prev = t;

	switch(lvl)
	{
		// Normal shot
		case 1:
			player_shoot_projectile(obj_player_x_shot_x1_3);
			with (obj_player_x_shot_x1_3){
				atk = 2;
			}
			player_super_shoot_animation();
		break;
		// Special Charged shots; Works like nightmare buster
		case 2:
		case 3:
		case 4:
			charge_level = lvl;
			audio_play(snd_missileshot);
			player_state_set(states.x_buster_cm);
		break;
		/*case 5:
			player_shoot_projectile(obj_player_x_shot_xcm);
			with (obj_player_x_shot_xcm){
				shot_parent = self;
				y += irandom_range(-15,5);
				abs_hspeed = 4;
				h_speed = abs_hspeed * dir;
				atk = 4;
			}
		break;*/
	}


}
