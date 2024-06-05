///@Description Set whether or not game is paused and for what reason
///@param {Bool} paused whether or not game is paused
///@param {Real} pause_type reason of game pausing (pause_types.pause_type)
function pause_set() {
	G.paused = argument[0];
	if (argument_count > 1)
		G.pause_type = argument[1];
	if (!G.paused)
		G.pause_type = pause_types.none;


}
