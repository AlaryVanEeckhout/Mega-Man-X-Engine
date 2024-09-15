function player_state_x_buster_cm() {
	var t = state_timer++;
	
	if (t == 0) {
		xcm_buster_count = 0;
		xcm_buster_limit = charge_level-1;
		if charge_level >= 4
			xcm_buster_limit=4;
	}
	if (t mod xcm_buster_interval == 0 && xcm_buster_count < xcm_buster_limit) {
		var inst = 
			player_shoot_projectile(obj_player_x_shot_xcm)
			with (obj_player_x_shot_xcm)
					y += irandom_range(-25,25);
			player_shoot_projectile(obj_player_x_shot_xcm)
			with (obj_player_x_shot_xcm)
					y += irandom_range(-5,5);
			player_shoot_projectile(obj_player_x_shot_xcm)
			with (obj_player_x_shot_xcm)
					y += irandom_range(-15,15);
			player_shoot_projectile(obj_player_x_shot_xcm)
			with (obj_player_x_shot_xcm)
					y += irandom_range(-25,25);
			player_shoot_projectile(obj_player_x_shot_xcm)
			with (obj_player_x_shot_xcm)
			{
					y += irandom_range(-5,5);
					abs_hspeed = 4;
					h_speed = abs_hspeed * dir;
			};
		xcm_buster_function(inst, xcm_buster_count);
		animation_play("shoot");
		xcm_buster_count++;
		if (xcm_buster_count >= xcm_buster_limit) {
			animation_play("super_shoot");
			log("super shoot")
		}
	}
	
	
	if (animation == "super_shoot" && animation_t >= animation_length) {
		log("xcm buster end");
		player_check_dash();
		player_check_jump();
		player_check_idle();
		player_check_fall();
	}
	player_charge_reset();
}