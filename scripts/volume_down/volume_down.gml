function volume_down() {
	if (global.volume > 0)
	    global.volume -= 0.2;
	audio_master_gain(global.volume);



}
