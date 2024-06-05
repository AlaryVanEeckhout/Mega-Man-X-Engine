function player_x_buster_x8_icarus(lvl = -1, t) {
	charge_level = -1;
	shoot_limit = 16;
	shoot_animation = "";
	shoot_type = shoot_types.normal;

	switch(lvl)
	{
		// Semi-Charged shot
		case 0:
			player_shoot_projectile(obj_player_zero_shot_x1_2);
		break;
		// Fully-Charged shot
		case 1:
			player_shoot_projectile(obj_player_x_shot_x1_3);
		break;
		// Super-Charged shot
		case 2:
			player_shoot_projectile(obj_player_x_shot_op);
			player_super_shoot_animation();
		break;
		// Icarus Lazer Shot
		case 3:
			player_shoot_projectile(obj_player_x_shot_x8_icarus);
			with(obj_player_x_shot_x8_icarus){
				lazer_section = "Middle";
			}
			player_shoot_projectile(obj_player_x_shot_x8_icarus);
		break;
	}


}
