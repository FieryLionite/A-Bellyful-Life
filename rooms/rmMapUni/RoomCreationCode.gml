if (ControlEnv.hours > 18 || ControlEnv.hours < 6)
	    set_night_bg();
	else
	    set_day_bg();
		
audio_sound_gain(bgmA, 1, 30);
audio_sound_gain(bgmB, 0, 30);