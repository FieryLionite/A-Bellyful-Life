refresh_fridge();

audio_play_sound(fridge_open, 0,0);
audio_play_sound(fridge_loop, 0,1);

audio_sound_gain(fridge_loop, 1.3, 30);