function schedule_get_location(charid) {
	
	char = global.dialogue_char;
	
	if (argument_count == 1 && charid != undefined){
		char = charid;	
	}
	
	if (char!= noone && char.in_bathroom > 0)
		return noone;
		
	///////FIX
	if (char == noone && object_get_parent(object_index) == Character)
		char = id;
		
	if (char.shrink > 0)
		return noone;
		
	if (char.go_resort && ButtonMap.last_map == rmMapResort && !is_map() && is_location()){
		return room;	
	}
	
	if (char.following && in_house() && is_location()){
		return room;	
	}
	
	if (char.visiting){
		return char.visit_location;	
	}
	
	if (argument_count > 1)
	for (var i = 0; i < argument_count; i +=3){
	    var time_start = argument[i];
	    var time_end = argument[i+1];
	    if (ControlEnv.hours < time_end &&
	        ControlEnv.hours >= time_start){
	        return argument[i+2];   
	    }
	}
	
	if (!instance_exists(char))
		return noone;
		
	if (char.eating_out)
		return char.eating_out_location;
	
	//HERE
	
	

	return noone;
}
