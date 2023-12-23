/// @description Override me for each option

if (selected >= 0 && selected < 4)
    audio_stop_all();
switch(selected)
{
    case 0:
        audio_play_sound(music_classical, 0, true);
        audio_sound_gain(music_classical, 0.4, 0);
        break;
    case 1:
        audio_play_sound(music_trance, 0, true);
        audio_sound_gain(music_trance, 0.4, 0);
        break;
    case 2:
        audio_play_sound(music_lowfi, 0, true);
        audio_sound_gain(music_lowfi, 0.4, 0);
        break;
    case 3:
        
        break;
    
    default: break;
}

result = check_music();
if (result != "true"){
    choose("I dont really like that song, could you play some " + string(result)+" music?",
        "I'd prefer " + string(result) + " music. Could you play some?");
}else{
    say (choose("That's more like it.",
        "I like the song.",
        "*She starts humming to the song*"));
        
}

instance_destroy();

