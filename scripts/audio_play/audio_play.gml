if (!global.audio_enabled) return noone;
var index = audio_play_sound(argument[0], 0, 0);
ds_list_add(global.audio_playing_list, [index, argument[0]]);