/// @description Execute script if defined with or without argument
function script_try(scr, arg = undefined) {
	if (script_exists(scr)) {
		if (is_undefined(arg)) {
			script_execute(scr);
		} else {
			script_execute(scr, arg);
		}
	}
}
