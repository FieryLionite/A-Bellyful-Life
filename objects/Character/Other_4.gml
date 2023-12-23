expression = ex_idle;

if (global.watched_inflate && following){
	global.dialogue_char = id;
	var msg = "";
	if (desire_inflate > 0){
			msg = inflate_interest_msg;
			
			if (!today_watched_inflate){
				desire_inflate += 3;
				splash_message("inflate desire +3",c_lime);
				today_watched_inflate = true;
			}
	}else if (desire_inflate == 0){
		msg = disinterest_msg;	
	}else{
		msg = hate_msg;	
	}
	
	ctb_list(noone, noone, msg);
	global.watched_inflate = false;
}

if (eating_out && room == eating_out_location){
	alarm[10] = 2; //eating_out = false
	if (eating_out_script == -1){
		ctb_msg("[speaker:noone]Dialogue for eating out with this character has not been written yet :(",
			"This is the dev (Fiery), I just want to let you know I'm always looking for help with writing for the game.");
		return;
	}
	
	script_execute(eating_out_script);
}