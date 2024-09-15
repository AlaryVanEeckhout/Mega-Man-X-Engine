var t = state_timer++;
enum door_states { none, open, close };
#region States
switch(state) {
	case door_states.none:
		state_timer = 0;
		break;
	case door_states.open:
		if (t == 0) {
			target.locked = true;
			animation_play("O");
			audio_play(snd_door_default);
			if (boss_door) {
				music_stop(2900);	// fade out for 2.9 seconds
			}
			with (obj_player_shot_parent) {
				instance_destroy();	
			}
			with (target) {
				shots_count = 0;
				charged_shots_count = 0;
			}
			
			pause_set(true, pause_types.door);
			event_user(0);
		}
		if (animation_end) {
			moving_target = true;
			animation_play("N");
		}
		if (!moving_target) {
			target.animation_ignore_frame = 1;
		} else {
			global.current_camera = camera_id;
			if (is_vertical) {
				target.y += 72 / 116 * dir;
				if target.state == states.ride{
					if target.x != (bbox_left + bbox_right)/2{
						target.ride_char_pos.x += (bbox_left + bbox_right)/2 - target.x;
						target.x = (bbox_left + bbox_right)/2; // center of door
					}
					var _addy = 1;
					target.y += _addy * dir; // if in ride fall faster to not get stuck in door
					target.ride_char_pos.y += (_addy + 72 / 116) * dir; // make the char in ride follow ride properly
				}
			} else {
				target.x += 56 / 116 * dir;
				if target.state == states.ride{
					var _addx = 0.25;
					target.x += _addx * dir; // if in ride walk faster to not get stuck in door
					target.ride_char_pos.x += (_addx + 56 / 116) * dir; // make the char in ride follow ride properly
				}
			}
			if target.state != states.ride
				event_user(0); // Player animation
		}
		if (t >= open_limit) {
			state_set(door_states.close);
			moving_target = false;
		}
		target.physics_ignore_frame = 1;
		break;
	case door_states.close:
		if (t == 0) {
			animation_play("C");
			if (!boss_door)
				audio_play(snd_door_default);
			else audio_play(snd_door_boss);
			event_user(0);
			pause_set(false);
		}
		if (boss_door && is_vertical) {
			target.physics_ignore_frame = 1;
		}
		if (animation_end && t >= close_limit) {
			state_set(door_states.none);
			animation_play("S");
			// Unlock player
			target.locked = false;
			if (!is_vertical) {
				target.dir = dir;
				target.xscale = dir;
			}
			var wall = instance_create_layer(x, y, "blocks", obj_square_16);
			wall.image_xscale = sprite_width / 16;
			wall.image_yscale = sprite_height / 16;
			if (boss_door) {
				var boss_inst = instance_nearest(x, y, par_boss_spawner);
				target.locked = true;
				if (is_vertical) {
					h_speed = 0;
					v_speed = 0;
				}
				if (instance_exists(boss_inst)) {
					boss_inst.spawn = true;
				} else { // if there is no boss in the boss room when entering
					with (target) {
						//state_set(states.idle, 0, [-1]); // Set idle but wait for the next state
						wait_state = states.outro;
						if state == states.ride{
							with ride_inst
								ride_eject();
						}
						substates[0] = -1;
						wait_state_limit = 60;
						immortal = true;
					}
				}
			}
		}
		break;
}
#endregion
animation_update(true);