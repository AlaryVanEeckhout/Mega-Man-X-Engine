function player_x_buster_x4_stack(lvl = -1, t) {
	charge_level = -1;
	shoot_limit = 16;
	shoot_animation = "";
	shoot_type = shoot_types.normal;

	switch(lvl)
	{
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shot_1);
		break;
		// None
		case 1:
		break;
		// None
		case 2:
		break;
		// Stack Charged shot
		case 3:
			charge_level = lvl + 1;
		break;
		case 4:
			charge_level = lvl + 1;
			player_shoot_projectile(obj_player_zero_shot_x5);
		break;
		case 5:
			charge_level = lvl + 1;
			player_shoot_projectile(obj_player_zero_shot_x5);
		break;
		case 6:
			charge_level = lvl + 1;
			player_shoot_projectile(obj_player_zero_shot_x5);
		break;
		case 7:
			player_shoot_projectile(obj_player_zero_shot_x5);
		break;
	
	}


}
