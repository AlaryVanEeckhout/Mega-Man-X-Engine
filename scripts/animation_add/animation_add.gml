/// @description Add new animation
/// @param {String} name name of the anim & sprite. can use "|" to specify the name of the sprite to use
/// @param {Array} key_frames frames of the anim, grouped by two: first for anim frame and second for image index
/// @param {Real} loop_start the frame where infinite anim loop starts
/// @param {Real} loop_end the frame where infinite anim loop ends
function animation_add() {

	var _name = argument[0];
	var str_list = string_split(_name, "|");
	var _sprite_name = _name;

	if (ds_list_size(str_list) == 2) {
		_name = str_list[| 0];
		_sprite_name = str_list[| 1];
	}

	ds_list_destroy(str_list);

	animations_frames[? _name] = (argument_count > 1) ? argument[1] : [];
	animations_loop[? _name] = [];
	animations_sprite_name[? _name] = _sprite_name;

	if (argument_count > 2) {
		animations_loop[? _name] = [argument[2], (argument_count > 3) ? argument[3] : argument[2]];
	}



}
