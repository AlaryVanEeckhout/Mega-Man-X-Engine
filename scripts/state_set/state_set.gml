///@Description Set the state of calling instance
///@param {Real} state states.state
///@param {Real} state_timer
///@param {Array} _arr array of substates to set
function state_set() {
	state = argument[0];
	state_timer = (argument_count > 1 ? argument[1]: 0);
	if (argument_count > 2)
	{
		var arr = argument[2];
		for (var i = 0; i < array_length_1d(arr); i++)
		{
			substates[i] = arr[i]
		}
	}


}
