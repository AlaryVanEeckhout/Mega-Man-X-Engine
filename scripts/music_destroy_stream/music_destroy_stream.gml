///@Description audio_stop_sound of global.music_playing_index and
///
///audio_destroy_stream of global.music_streamed_info for all 2 indexes
function music_destroy_stream() {
	for(var i = 0; i < 2; i++)
	{
		audio_stop_sound(global.music_playing_index);
		if (global.music_streamed_info[i] != noone)
		{
			audio_destroy_stream(global.music_streamed_info[i]);
		}
	}


}
