function player_idle() {
	var char =  Anna;
	if (room == rmBedroom)
	    if (ControlEnv.hours < 6)
	        say_bubble(Anna, "zzz");
	    else
	        say_bubble(Anna, choose("*Stares at her phone*",
	                            "How was your day?",
	                            "Whats up?",
	                            "*Reading her novel*"));
                            
	if (room == rmClassroomSci || room == rmClassroomHum)
	    say_bubble(Anna, choose("*Listen intently to the professor*",
	                            "*Taking notes seriously*",
	                            "*Nodding her head to the lession*"));



}
