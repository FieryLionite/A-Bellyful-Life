function location_get_background(argument0) {
	var location = argument0;

	switch(location){
	    case l_dorm:
	        return bg_dorm;
	    case l_classroom:
	        return bg_classroom;
	    case l_hallway:
	        return bg_hallway;
	    case l_store:
	        return bg_store;
	}



}
