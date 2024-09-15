if (spawn) {
	var player_inst = instance_find(obj_player_parent, 0);
	var t_limit = timer_limit[timer_id];
	if (timer_id == 0) {
		if (timer == 0 && boss_object != noone) {
			music_play(boss_encounter_theme);	
		}
		if (timer > t_limit) {
			if (walk_to_x != infinity && abs(walk_to_x - player_inst.x) >= 1) {
				var _on_floor;
				with (player_inst){
					_on_floor = is_on_floor();
				}
				if (!player_inst.walking_to_x && _on_floor) {
					player_inst.walking_to_x = true;
					player_inst.dest_x = walk_to_x;
					player_inst.animation = "";
					if player_inst.state != states.ride{
						with (player_inst) {
							animation_play("walk", 0);
						}
					} else{
						with instance_nearest(player_inst.x, player_inst.y, par_ride_armor){
							animation_play("walk", 0);
						}
					}
				}
			}
			timer = -1;
			timer_id++;
		}
	} else {
		if (timer > t_limit) {
			if (boss_object != noone) {
				show_debug_message("walk_to_x : x")
				show_debug_message(string(walk_to_x) + " : "+ string(player_inst.x))
				if (walk_to_x == infinity || abs(walk_to_x - player_inst.x) < 1 || player_inst.state == states.ride && abs(walk_to_x - player_inst.x) < 2) {
					var inst = instance_create_depth(x, y, depth - 10, boss_object);
					with (inst) {
						event_perform(ev_step, ev_step_normal);	
					}
					spawn = false;
				}
			}
			if (walk_to_x == infinity || abs(walk_to_x - player_inst.x) < 1 || player_inst.state == states.ride && abs(walk_to_x - player_inst.x) < 2) {
				spawn = false;
				instance_destroy();
			}
		}
	}
	timer++;

}