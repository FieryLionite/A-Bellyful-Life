function gate_goto(argument0) {
	audio_stop_sound(bellyair);
	audio_stop_sound(minloop);

	Gate.running = true;
	Gate.target_room = argument0;
	audio_play_sound(snd_gate, 1, false);



}
