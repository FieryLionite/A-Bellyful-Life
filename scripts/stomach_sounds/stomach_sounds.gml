function play_stomach_sound(){
	if (!is_playing_stomach_sound())
		audio_play_sound(choose(snd_hungry14, snd_hungry16, snd_hungry4),0,0);
}

function is_playing_stomach_sound(){
	return audio_is_playing_all(snd_hungry14, snd_hungry16, snd_hungry4);
}