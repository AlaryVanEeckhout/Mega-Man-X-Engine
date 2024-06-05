function player_state_ceil_cling() {
	var t = state_timer++;
	//animation_play("ceil", t);
	animation_play("crouch", t);
	y_dir = -1;

	grav = 0;
	v_speed = 0;
	saber_atk_unlocked[saber_atks.jump] = false;

	if (move != 0) {
		dir = move;
		xscale = move;
	}

	var condition = (t >= ceil_cling_limit || !is_on_ceil());
	
	condition |= key_p_jump;
	
	if (condition) {
		grav = gravity_default;
		player_state_set(states.fall, 0);
		y_dir = 1;
		if saber_unlocked
			saber_atk_unlocked[saber_atks.jump] = true;
	}

	player_check_dash();

	if (state == states.dash){
		y_dir = -1;
	}
	var saber_condition = (saber_unlocked && key_shoot2);
	if saber_condition{
		y_dir = 1;
		state_set(states.saber_down);
		saber_atk_unlocked[saber_atks.jump] = true;
	}}