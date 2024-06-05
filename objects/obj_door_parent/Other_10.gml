/// @description Handle initial player animation
if (state == door_states.open && !moving_target) {
	target.animation_ignore_frame = 0;
	target.v_speed = 0;
	target.h_speed = 0;

	if (is_vertical && dir == 1) {
		if target.state != states.ride{
			with (target) {
				animation_play("fall", 8);
				state_set(states.fall, 8);
			}
		} else{
			with instance_nearest(x, y, par_ride_armor){
				state_set(RIDE_ARMOR_STATE.FALL);
				animation_play("fall", 8);
			}
		}
	} else if (!target.animation_is_looping) {
		target.animation_ignore_frame = 1;
	}
} else {
	if (!moving_target && boss_door)
		pause_set(false);
	with (target) {
		player_disable_speed_gear();
		player_dolor_reset();
		player_saber_reset(false);
		player_effects_reset();
		immunity = false;
		shoot_enabled = true;
		audio_stop(hover_sound);
		if (!other.is_vertical) {
			animation_ignore_frame = 0;
			if (!other.moving_target) {
				if state != states.ride
					player_check_idle();
				else if (is_on_floor())
					with ride_inst
						ride_armor_idle();
			} else if (is_on_floor() && !is_on_ceil() && state != states.dash && state != states.fall) {
				animation_play("walk");
				if state != states.ride
					state_set(states.walk);
				else
					with ride_inst
						state_set(RIDE_ARMOR_STATE.WALK);
			}
			if (other.moving_target && !animation_is_looping && state != states.walk) {
				animation_ignore_frame = 1;
			}
			if (!other.moving_target && state != states.jump && state != states.fall) {
				if state != states.ride
					player_check_fall();
				else
					with ride_inst
						ride_armor_check_fall();
			}
		} 
	}
}