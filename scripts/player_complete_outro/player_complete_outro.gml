function player_complete_outro() { // Boss has been defeated, player has walked to final position if necessary
	if state != states.ride
		state_set(states.idle, 0);
	if (teleport_outro) {
		if state == states.ride
			with ride_inst
				ride_eject();
		substates[0] = -1; // Set idle but wait for the next state
		complete_next_state = states.outro;
		if (boss_complete_music != "")
			music_play(boss_complete_music);
	}
}
