if (in_dialogue() || !flip_press)
	exit;

if (target_room != noone){
	time_forward_minutes(1);
	alarm[0]= 1;
	if (Player.encumbered && target_room != global.last_room){
		change_energy(Player, -1, true);
		sndWalk = get_random_asset("sndSloshWalk", 1, 4);
		audio_play_sound(sndWalk, 0, 0);
		alarm[0]= 45;
	}else if (is_location() && !audio_is_playing_all(sndFootstep1,sndFootstep2,sndFootstep3,sndFootstep4)){
		sndWalk = get_random_asset("sndFootstep", 1, 4);
		audio_play_sound(sndWalk, 0, 0);
	}
	
}

if (target_script != noone)
	target_script();