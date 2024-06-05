function player_x_buster_x8_hermes(lvl = -1, t) {
	charge_level = -1;
	shoot_limit = 16;
	shoot_animation = "";
	shoot_type = shoot_types.normal;
	var angles = [0, 45, -45];
	var angles2 = [0, 60, 45, -60, -45];

	switch(lvl)
	{
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shot_1);
		break;
		// Semi-Charged shot
		case 1:
			player_shoot_projectile(obj_player_zero_shot_x1_2);
		break;
		// Fully-Charged shot
		case 2:
			player_shoot_projectile(obj_player_x_shot_x1_3);
		break;
		// Hermes triple Fully-Charged Shots
		case 3:
			for (var i = 0; i < 3; i++)
			{
				shot_current_angle_index = i;
				shot_angle = angles[shot_current_angle_index];
				player_shoot_projectile(obj_player_x_shot_x8_hermes);
			}
			shots_count -= 2;
			player_super_shoot_animation();
		break;
		case 4:
			for (var i = 0; i < 5; i++)
			{
				shot_current_angle_index = i;
				shot_angle = angles2[shot_current_angle_index];
				player_shoot_projectile(obj_player_x_shot_x8_hermes);
			}
			shots_count -= 2;
			player_super_shoot_animation();
		break;
	}


}
