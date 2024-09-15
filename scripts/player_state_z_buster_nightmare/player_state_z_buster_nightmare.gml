function player_state_z_buster_nightmare() {
	var t = state_timer++;
	
	if (t == 0) {
		saber_atk_unlocked[saber_atks.atk1] = false;
		animation_play("buster_charge");
		z_buster_count = 0;
	}
	if (charge_level >= 3 && t mod z_buster_interval == 0 && z_buster_count < z_buster_limit) {
		var inst = player_shoot_projectile(z_buster_object);
		z_buster_function(inst, z_buster_count);
		z_buster_count++;
		if (z_buster_count >= z_buster_limit) {
			animation_play("buster_nightmare");	
		}
	} else if (charge_level < 3 && t == z_buster_charge_interval/4 << 0) {
		animation_play("buster_nightmare");
		var inst = player_shoot_projectile(z_buster_object);
	} 
	
	
	if (animation_end) {
		player_charge_reset();
		player_check_dash();
		player_check_jump();
		player_check_idle();
		player_check_fall();
		saber_atk_unlocked[saber_atks.atk1] = true;
	}

	player_saber_reset();
	if (charge_level < 3)
		player_charge_reset();
}