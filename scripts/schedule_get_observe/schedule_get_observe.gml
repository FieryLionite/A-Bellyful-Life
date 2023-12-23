function schedule_get_observe() {
	for (var i = 0; i < argument_count; i +=3){
	    var time_start = argument[i];
	    var time_end = argument[i+1];
	    if (ControlEnv.hours < time_end &&
	        ControlEnv.hours >= time_start){
	        var value = argument[i+2];
	        //if is script index then execute it
	        if (is_real(value)){
	            script_execute(value);
	            //dont output message, let the script do it
	            return false;
	        }   
	        return argument[i+2];   
	    }
	}

	return noone;



}
