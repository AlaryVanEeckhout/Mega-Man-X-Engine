// Needs refactoring, make item chance defined in create event, ...
function ene_item() {
	if (hp <= 0 && !intro && (!is_boss || state != boss_states.death)) {
		if (death_type == death_types.blink)
			item = false;
		if (dead) {
			dead_timer--;
			if (death_type == death_types.blink) {
				visible = dead_timer mod 2;
			}
			if (dead_timer <= 0) {
				dead = false;
				item = true;
				death_type = death_types.normal;
			}
		}
		if (item) {
			    var randI = random(100);
				to_create = noone;
				if (obj_player_parent.using_special_weapon && (obj_player_parent.char_name == "axl")){
					var items = [obj_pickup_dna_core];
					var chances = [100];
					// get object name from id, then "obj_enemy" becomes "obj_a_trans_enemy"
					var a_trans_enemy_name = string_replace(object_get_name(object_index), "obj", "obj_a_trans")
					// get object id from name, then store it as a potential body that axl can transform into
					obj_player_parent.a_trans_body_new = asset_get_index(a_trans_enemy_name);
				}
				else{
					var items = [noone,
								 obj_pickup_life_1, obj_pickup_life_2, obj_pickup_life_3,
							     obj_pickup_wp_1, obj_pickup_wp_2, obj_pickup_wp_3,
								 obj_pickup_lifeup];
					var chances = [60,
								   10, 8, 1,
								   10, 8, 1,
								   2];
				}
				var q = 0;
				for (var i = 0; i < array_length(items); i++) {
					var new_q = q + chances[i];
					if (q <= randI && randI < new_q) {
						to_create = items[i];
						break;
					} else {
						q = new_q;	
					}
			}
		    if (to_create != noone) {
		        var inst = instance_create_depth(x, y, depth - 1, to_create);
				if (instance_exists(inst)) {
			        inst.is_temporary = true;
					inst.v_speed = -3;
				}
		    }
		}
		switch (death_type) {
			case death_types.normal:
				instance_create_layer(x, y, layer, explode_FX);
				scr_scrap();
				instance_destroy();
				break;
			case death_types.blink:
				if (!dead) {
					dead = true;
					dead_timer = 60;
					vspd = 0;
					grav = 0;
				}
				image_speed = 0;
				break;
		}
	}
}
