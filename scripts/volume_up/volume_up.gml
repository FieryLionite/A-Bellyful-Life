function volume_up() {
	if (global.volume < 1)
	    global.volume += 0.2;
	audio_master_gain(global.volume);



}
