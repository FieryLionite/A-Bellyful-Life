function close_time_kick() {
	if (!ds_map_exists( global.close_times, room))
		return;
	
	//kicks the player out if the location is closed at this time
	if (ControlEnv.hours >= global.close_times[? room]){
	    custom_goto(rmMapUni);
	    ctb_list(noone, noone, "The location is closed at this time.");
	}



}
