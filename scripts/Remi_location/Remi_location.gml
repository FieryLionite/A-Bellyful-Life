function Remi_location(){
	//fix bug: when player run to bathroom
	if (Remi.catching != noone && room == rmBathroom){
		Remi.catching = noone;	
	}
	
	if (Remi.catching != noone  && is_location() && !is_map()){
		if (room != Remi.catching){
			Remi.catching = noone;
			return noone;
		}
			
		if (Remi.catch_dialogue){
			Remi.catch_dialogue = false;
			Remi.has_number = true;
			if (Remi.catch_success){
				ControlEnv.money -= 50;
				Remi.likability -= 5;
				exelan("msg_Remi_catch_success");	
			}else{
				exelan("msg_Remi_catch_failed");
			}
		}
		
		return room;
	}
		
	return schedule_get_location();
}