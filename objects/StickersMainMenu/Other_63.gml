var i_d = ds_map_find_value(async_load, "id");
if i_d == global.name_async
{
    if ds_map_find_value(async_load, "status")
    {
        if ds_map_find_value(async_load, "result") != ""
        {
            global.name = ds_map_find_value(async_load, "result");
			custom_goto(rmBedroom);
			audio_stop_sound(bgm_intro);
			audio_play_sound(bgmA_intro, 0, 0);
			audio_sound_gain(bgmA_intro, 0.4, 0);
        }
    }
}