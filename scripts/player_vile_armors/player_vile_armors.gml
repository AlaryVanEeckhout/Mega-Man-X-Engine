function player_vile_armors() {
	// Default

	if (FULL == "mkii") {
		dash_normal_length = 100;
		dash_air_unlocked = true;
		damage_reduction = 0.25;
	}
	if (FULL == "mkv") {
		player_weapon_set(0, weapons.z_buster);
		weapon[1] = weapons.lightning_bolt;
		weapon[2] = weapons.homing_torpedo;
		weapon[3] = noone;
		player_weapon_select(weapons.z_buster);
		charge_unlocked = true;
		charge_level_max = 3;
		damage_reduction = 0.75;
	}

}
