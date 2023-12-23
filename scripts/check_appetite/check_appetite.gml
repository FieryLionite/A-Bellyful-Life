function check_appetite() {
	//check music
	//check rubbing

	if (global.session_finished){
	    return msg_finish();
	}


	var result = check_music();

	if (result != "true"){
	    return choose("I'd like to listen to some " + string(result)+" music first.",
	        "I'm in the mood for some " + string(result) + " music. Could you play some?",
	        "can you play some " + string(result) + " music? It sets me in the mood.");
	}

	if (instance_exists(Blockage)){
	    return msg_pressure();
	}

	if (global.patient.craving == noone){
	    return "I'm not really hungry for the moment, maybe we should wait a bit.";
	}



	return "true";



}
