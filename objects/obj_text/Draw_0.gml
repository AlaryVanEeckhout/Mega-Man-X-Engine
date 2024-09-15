draw_offset_view();
draw_string(10, 140, string(global.player_lives));
if (global.paused && global.pause_type == pause_types.normal) {
	//centerx 160 centery 120
		draw_string_center(160, 20, "room: " + room_get_name(room));
		draw_string_center(160, 40, "PAUSED");
		draw_string_center(160, 120, "OG:" + string_upper(G.character_armor_name[global.character_selected_index[0]][G.player_character_armor_index[global.character_selected_index[0]][0]]));
		draw_string_center(80, 80, "HEAD:" + string_upper(G.character_armor_name[global.character_selected_index[0]][G.player_character_armor_index[global.character_selected_index[0]][1]]));
		draw_string_center(240, 100, "BODY:" + string_upper(G.character_armor_name[global.character_selected_index[0]][G.player_character_armor_index[global.character_selected_index[0]][2]]));
		draw_string_center(80, 140, "ARMS:" + string_upper(G.character_armor_name[global.character_selected_index[0]][G.player_character_armor_index[global.character_selected_index[0]][3]]));
		draw_string_center(240, 160, "LEGS:" + string_upper(G.character_armor_name[global.character_selected_index[0]][G.player_character_armor_index[global.character_selected_index[0]][4]]));
		draw_string_center(160, 200, "FULL:" + string_upper(G.character_armor_name[global.character_selected_index[0]][G.player_character_armor_index[global.character_selected_index[0]][5]]));
		
		// debug stuff 'cause I don't know where else to put it
		if keyboard_check(G.key_weapon1) && keyboard_check(G.key_weapon2){
			if keyboard_check(G.key_special){ // life control
				if keyboard_check_pressed(G.key_up)
					G.player_lives += 1;
				if keyboard_check_pressed(G.key_down)
					G.player_lives -= 1;
				if keyboard_check_pressed(G.key_left) && instance_exists(par_boss)
					par_boss.hp = 0;
				if keyboard_check_pressed(G.key_right) && instance_exists(par_boss)
					par_boss.hp += 25;
			} else if (keyboard_check(G.key_shoot)){ // hp control
				if keyboard_check_pressed(G.key_up)
					obj_player_parent.hp += 1;
				if keyboard_check_pressed(G.key_down)
					obj_player_parent.hp -= 1;
				if keyboard_check_pressed(G.key_left) && instance_exists(par_boss)
					par_boss.hp -= 1;
				if keyboard_check_pressed(G.key_right) && instance_exists(par_boss)
					par_boss.hp += 1;
			} else if (keyboard_check(G.key_shoot2)){ // weapon control
				if keyboard_check_pressed(G.key_up)
					obj_player_parent.charge_level_max += 1;
				if keyboard_check_pressed(G.key_down)
					obj_player_parent.charge_level_max -= 1;
				if keyboard_check_pressed(G.key_left)
					obj_player_parent.current_weapon -= 1;
				if keyboard_check_pressed(G.key_right)
					obj_player_parent.current_weapon += 1;
			} else{
				var _move_speed = 8;
				if keyboard_check(G.key_up){
					obj_player_parent.y -= _move_speed;
					obj_camera_rds.y -= _move_speed;
				}
				if keyboard_check(G.key_down){
					obj_player_parent.y += _move_speed;
					obj_camera_rds.y += _move_speed;
				}
				if keyboard_check(G.key_left){
					obj_player_parent.x -= _move_speed;
					obj_camera_rds.x -= _move_speed;
				}
				if keyboard_check(G.key_right){
					obj_player_parent.x += _move_speed;
					obj_camera_rds.x += _move_speed;
				}
				if  keyboard_check(G.key_up) || keyboard_check(G.key_down) ||  keyboard_check(G.key_left) || keyboard_check(G.key_right){
					with obj_camera_rds {
						__view_set( e__VW.XView, view_id, x-__view_get( e__VW.WView, view_id )*0.5);
						__view_set( e__VW.YView, view_id, y-__view_get( e__VW.HView, view_id )*0.5);
					}
				}
			}
		}
}
if (global.show_fps) {
	draw_string(266, 4, "FPS:" + string(fps));
}