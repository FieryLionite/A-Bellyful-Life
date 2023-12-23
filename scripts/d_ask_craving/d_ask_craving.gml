function d_ask_craving() {
	var result = check_appetite();
	if (result != "true"){
	    say(choose("I'm not really comfortable right now to want to eat",
	        "Can we improve the atmosphere a bit?",
	        "I'd like to be in a more comfortable mood."))
	    //say(result);
	}else{
	    say(choose("I would love to have some " + global.patient.craving.name+ " right now.",
	        "Can I have some " + global.patient.craving.name + "?",
	        "Do you have any " + global.patient.craving.name + "?",
	        "I'd like some "  + global.patient.craving.name
	        ));
	}



}
