if (ControlEnv.hours > 18 || ControlEnv.hours < 6)
	    set_night_bg();
	else
	    set_day_bg();
		
audio_sound_gain(bgmA, 0, 30);

if (!audio_is_playing(bgmB))
	audio_play_sound(bgmB, 0, 1);
audio_sound_gain(bgmB, 1, 30);