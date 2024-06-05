function player_x_buster_cm(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_limit = 16;
	shoot_type = shoot_types.normal;
	shoot_animation = "";

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
		// Special Charged shots; Works like stock buster
		case 2: // Parent of following cases
			player_shoot_projectile(obj_player_x_shot_x2_super2);
			with (obj_player_x_shot_x2_super2){
				shot_parent = self;
				y += -5;
				abs_hspeed = 6;
				h_speed = abs_hspeed * dir;
				atk = 3;
			}
		break;
		case 3: // Goes to case 2
			charge_level = lvl - 1;
			player_shoot_projectile(obj_player_x_shot_x2_super2);
			with (obj_player_x_shot_x2_super2){
				shot_parent = self;
				y += irandom_range(-10,5);
				abs_hspeed = 5;
				h_speed = abs_hspeed * dir;
				atk = 3;
			}
		break;
		case 4: // Goes to case 5
			charge_level = lvl + 1;
			player_shoot_projectile(obj_player_x_shot_x2_super2);
			with (obj_player_x_shot_x2_super2){
				shot_parent = self;
				y += irandom_range(-25,5);
				abs_hspeed = 3;
				h_speed = abs_hspeed * dir;
				atk = 6;
			}
		break;
		case 5: // Child of case 4, goes to case 3
			charge_level = lvl - 2;
			player_shoot_projectile(obj_player_x_shot_x2_super2);
			with (obj_player_x_shot_x2_super2){
				shot_parent = self;
				y += irandom_range(-15,5);
				abs_hspeed = 4;
				h_speed = abs_hspeed * dir;
				atk = 4;
			}
		break;
	}


}
