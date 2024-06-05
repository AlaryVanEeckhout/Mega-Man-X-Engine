enum armor_soldier {look, jump, ride, eject};
var _condition_ride_available = (instance_exists(par_ride_armor) && instance_nearest(x, y, par_ride_armor) != instance_nearest(x, y, obj_player_parent).ride_inst);
var _inst_near_ride = noone;
var _value_distance_ride = infinity;
if _condition_ride_available {
	_inst_near_ride = instance_nearest(x, y, par_ride_armor);
	_value_distance_ride = abs(x - _inst_near_ride.x);
}

var _inst_near_player = instance_nearest(x, y, obj_player_parent);
var _value_distance_player = abs(x - _inst_near_player.x);

#region States
var t = state_timer++;


switch(state) {
	#region Look
	case armor_soldier.look:
		log("look");
		h_speed = 0;
		if is_on_floor(){
			animation_play("L");
			if (_value_distance_player < 100){
				animation_play("L2"); log("look index");
				if _inst_near_player.x > x
					dir = 1;
				else
					dir = -1;
			}
			if (_value_distance_player < 75) && (_condition_ride_available && _value_distance_ride < 50)
					state_set(armor_soldier.jump);
			if (_value_distance_player < 25)
				state_set(armor_soldier.jump);
		}
		break;
	#endregion
	#region Jump into ride
	case armor_soldier.jump:
		log("jump");
		animation_play("J");
		if (t == 0) {
			v_speed = -5;
			if (_condition_ride_available && _value_distance_ride < 50){
				if _inst_near_ride.x > x
						dir = 1;
					else
						dir = -1;
				h_speed = abs_hspeed * dir;
			}
		}
		if (_condition_ride_available && (bbox_right-bbox_left)/2 == (_inst_near_ride.bbox_right-_inst_near_ride.bbox_left)/2)
			h_speed = 0;
		if (t > 3 && v_speed >= 0){
			if (_condition_ride_available && _value_distance_ride < 10) {
				v_speed = 0;
				h_speed = 0;
				state_set(armor_soldier.ride);
				ride_inst = _inst_near_ride;
				with ride_inst{
					immunity = true;
					image_speed = 1; // allow animations
					state_set(RIDE_ARMOR_STATE.ACTIVATED);
				}
			} else if (is_on_floor()){
				state_set(armor_soldier.look);
			}
		}
		break;
	#endregion
	#region Ride
	case armor_soldier.ride:
		log("ride");
		ride_char_pos = { x: x, y: y };
		animation_play("ride_armor")
		var _self_enemy = self;
		with ride_inst{
			log("ride image index: " + string(image_index))
			log("ride state: " + string(state));
			if t == 0{
				immunity = false;
				char_instance = _self_enemy;
				is_player = false;
			}
			_self_enemy.x = character_pos.x;
			_self_enemy.y = character_pos.y - 4;
			dir = _self_enemy.dir;
			if state == RIDE_ARMOR_STATE.IDLE{
				log("anim: " + string(animation));
				log("anim_sprite: " + string(animation_sprite_name));
				log("ride ready");
				if (animation_on_end("activated")) {
					animation_sprite_name = "idle";
					log("anim end")
				}
				ride_armor_idle();
			}
		}
		if _inst_near_player.x > x
			dir = 1;
		else
			dir = -1;
		if (hp > 0 && hp <= 1){
			state_set(armor_soldier.eject); // make enemy fall from armor
			with ride_inst{
				char_instance = noone;
				is_player = true;
				state = RIDE_ARMOR_STATE.DEACTIVATING;
			}
		}
		if is_inside_view() == 0{ // disembark from ride just before despawning
			with ride_inst{
				char_instance = noone;
				is_player = true;
				state = RIDE_ARMOR_STATE.DEACTIVATING;
			}
		}
		break;
	#endregion
	#region Eject
	case armor_soldier.eject:
		log("eject");
		animation_play("J");
		if t == 0{
			v_speed = -4;
			h_speed += dir;
		}
		if (t >= 45 || (v_speed >= 0 && is_on_floor()))
			hp = 0;
		break;
	#endregion
}
if hp <= 0{
	with ride_inst{
		char_instance = noone;
		is_player = true;
		state = RIDE_ARMOR_STATE.DEACTIVATING;
	}
}
xscale = -dir;
#endregion