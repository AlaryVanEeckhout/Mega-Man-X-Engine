function player_zero_armors() {
	// Default
	saber_atk_animations[saber_atks.up] = "atk_ryuenjin";
	plt_index_default = 0;

	if (FULL == "black") {
		plt_index_default = 1;
		saber.plt_index = saber_color.purple;
		saber_atk_unlocked[saber_atks.spinning_jump] = true;
		saber_atk_animations[saber_atks.up] = "atk_denjin";
		saber_atk_unlocked[saber_atks.down] = true;
		saber_atk_unlocked[saber_atks.dash] = true;
		saber_atk_unlocked[saber_atks.raikousen] = true;
		damage_reduction = 0.5;
		for (var i = 0, len = array_length(saber_damage); i < len; i++) {
			saber_damage[i] *= 1.25;
		}
	}
	if (string_starts_with(FULL, "nightmare")) {
		player_zero_armor_nightmare();
		if (FULL == "nightmare") plt_index_default = 2;
		else if (FULL == "nightmare_2") plt_index_default = 3;
		else if (FULL == "nightmare_3") plt_index_default = 4;
		else if (FULL == "nightmare_4") plt_index_default = 5;
	}
	if (FULL == "x1") {
		weapon[2] = noone;
		charge_palette_enabled = true;
		mobile_buttons_set_sprite(spr_zero_x1_mobile_buttons);
		palette_texture_set(plt_zero_x1);
		ds_list_clear(special_weapons);
		dash_dust.y += 5;
		dash_speed = 4;
		dash_air_unlocked = false;
		double_jump_unlocked = false;
		saber_unlocked = false;
		shoot_unlocked = true;
		charge_unlocked = true;
		charge_level_max = 3;
		charge_limits[3] = charge_limits[2];
		glow_name = "glow_x1";
		weapon_allow_pallete = false;
		player_weapon_set(0, weapons.z_buster);
		player_weapon_set(1, weapons.homing_torpedo);
		player_weapon_set(2, weapons.storm_tornado);
		player_weapon_select(weapons.z_buster);
		player_special_weapons_add(states.dive_kick);		
		weapon_offsets_script = player_zero_x1_weapon_offsets;
		#endregion
	}

}
function player_zero_armor_nightmare() {
	weapon[2] = weapons.z_buster_nightmare;
	ds_list_clear(special_weapons);
	player_special_weapons_add(states.shin_messenko);
	plt_index_default = 2;
	saber.plt_index = saber_color.black;
	damage_reduction = 0.5;
	z_buster_object = obj_player_zero_shot_nightmare;
	shoot_unlocked = true;
	charge_unlocked = true;
	weapon_allow_pallete = false;
	z_buster_effect.object = obj_player_zero_shot_nightmare_charge;
	dolor_animation = "dolor2";
	player_weapon_set(0, weapons.nightmare_saber);
	player_weapon_select(weapons.nightmare_saber);
	player_special_weapons_add(states.teleport_dash);	
	saber_atk_animations[saber_atks.atk1] = "atk_nightmare";
	saber_atk_unlocked[saber_atks.atk2] = false;
	saber_atk_unlocked[saber_atks.atk3] = false;
	saber_atk_unlocked[saber_atks.spinning_jump] = false;
	saber_atk_unlocked[saber_atks.dash] = false;
	saber_atk_unlocked[saber_atks.raikousen] = false;
	saber_atk_sounds[saber_atks.atk1]           = snd_player_zero_saber_3d_1;
	saber_atk_sounds[saber_atks.atk2]           = snd_player_zero_saber_3d_1;
	saber_atk_sounds[saber_atks.atk3]           = snd_player_zero_saber_3d_2;
	saber_atk_sounds[saber_atks.jump]           = snd_player_zero_saber_3d_1;
	saber_atk_sounds[saber_atks.wall]           = snd_player_zero_saber_3d_1;
	saber_atk_sounds[saber_atks.spinning_jump]  = snd_player_zero_saber_3d_2;
	saber_atk_sounds[saber_atks.dash]           = snd_player_zero_saber_3d_1;
	saber_atk_sounds[saber_atks.charged_saber]  = snd_player_zero_saber_3d_2;
	charge_limits[3] = charge_limits[2];
	charge_level_max = 3;
	for (var i = 0, len = array_length(saber_damage); i < len; i++) {
		saber_damage[i] *= 1.25;
	}	
}
