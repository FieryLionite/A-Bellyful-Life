if (!global.settings[? "All Sounds"]){
	audio_set_master_gain(0, 0);	
}else{
	audio_set_master_gain(0, 1);	
}

if (!global.settings[? "Music"]){
	audio_sound_gain(bgm_intro, 0, 0);
	audio_sound_gain(bgmA, 0, 0);
	audio_sound_gain(bgmB, 0, 0);
	audio_sound_gain(rainbgm, 0, 0);
}

if (!audio_is_playing(bgm_intro)  && !audio_is_playing(bgmA_intro) && !audio_is_playing(bgmA)){
	audio_play_sound(bgmA, 0, 1);
}