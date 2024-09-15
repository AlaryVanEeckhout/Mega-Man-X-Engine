if global.paused
	image_speed = 0;
else
	image_speed = 1;
PAUSE;
if (!instance_exists(char_instance)) {
	event_user(0);
}