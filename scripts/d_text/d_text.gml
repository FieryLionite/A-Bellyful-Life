function d_text() {
	dialogue_init()


	dialogue_create(
	        "1",
	        "Where are you at?",
	        true,
	        d_text_location
	)
	
	dialogue_create(
	        "2",
	        "Want to come over to my place?",
	        true,
	        d_text_hangout
	)
	
	dialogue_create(
	        "2Status",
	        "Status",
	        true,
	        d_status
	)

	dialogue_start(true);

}

function d_text_location() {
	var char = global.dialogue_char;
	if (char.shrink){
		ctb_msg("You're so silly, I'm already inside your belly!");
		return;
	}
	
	location = script_execute(char.script_location);
	if (location != noone)
	    ctb_list(noone, noone, "I'm at the " + string_replace(room_get_name(location), "rm", ""));
	else
	   ctb_list(noone, noone, "I'm not really anywhere at the moment.")//"Sorry, I'm busy right now.");
}

function d_text_hangout() {
	if (ControlEnv.hours >= 23){
		ctb_list(noone, noone, "Sorry but its a bit too late for me.");
		return;
	}
	
	var char = global.dialogue_char;
	if (char.shrink){
		ctb_msg("You're so silly, I'm already inside your belly!");
		return;
	}
	
	if (char.visited){
		  if (char.visit_minutes > 0){
				ctb_list(noone, noone, "You're so silly! I'm already at your place right now.");
			}else
				ctb_list(noone, noone, "Didn't we already hang out today?");
		return;
	}
	
	var busy = false;
	var hour = ControlEnv.hours;
	for (var i=0; i <= 2; i++){
		ControlEnv.hours ++;
		//show_message(ControlEnv.hours);
		var location = script_execute(char.script_location);
		if (location != noone){
			busy = true;
			break;
		}
	}
	ControlEnv.hours = hour;
	
	if (char.likability >= 60)
		busy = false;
	
	//show_message(ControlEnv.hours);
	if (!busy && char.likability >= 0){
			if (char.visit_arrival > 0){
				ctb_list(noone, noone, "I'm coming!");
			}else if (!char.visited){
			    ctb_list(noone, noone, "Sure! I'll be over in around half hour.");
				char.visit_arrival = 30;
			}/*else{
				ctb_list(noone, noone, "Didn't we already hang out today?");
			}*/
	}else{
		ctb_list(noone, noone, "Sorry, I'm busy right now.");	
	}
	    
}
