///@Description Checks for collision block at given position
function is_place_free(_x, _y) {
	return !place_meeting(_x, _y, obj_block_parent);
}
