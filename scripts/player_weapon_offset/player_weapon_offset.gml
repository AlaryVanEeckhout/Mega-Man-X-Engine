///@tag Adds a weapon offset for a specific animation frame
///@param {String} anim animation name from player animations script
///@param {Real} image_index index of sprite to be associated with an offset
///@param {Real} offset_x Horizontal relative position of weapon
///@param {Real} offset_y Vertical relative position of weapon
function player_weapon_offset() {
	if (is_undefined(weapon_offset[? argument[0]]))
		weapon_offset[? argument[0]] = ds_list_create();

	var l = weapon_offset[? argument[0]];
	l[| argument[1]] = [argument[2], argument[3]];



}
