function player_megaman_armors() {
	// Default

	if (FULL == "rush_jet") {
		dash_normal_length = 100;
		dash_air_unlocked = true;
		damage_reduction = 0.25;
	}
	if (FULL == "rush_power") {
		player_weapon_set(0, weapons.z_buster);
		weapon[1] = noone;
		weapon[2] = noone;
		weapon[3] = noone;
		player_weapon_select(weapons.z_buster);
		charge_unlocked = true;
		charge_level_max = 3;
		damage_reduction = 0.75;
	}
	
	if (FULL == "super") {
		player_weapon_set(0, weapons.z_buster);
		player_weapon_select(weapons.z_buster);
		charge_unlocked = true;
		charge_level_max = 3;
		damage_reduction = 0.5;
		double_jump_unlocked = true;
		dash_air_unlocked = true;
	}

}
