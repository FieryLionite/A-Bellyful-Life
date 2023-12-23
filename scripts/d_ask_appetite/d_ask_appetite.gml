function d_ask_appetite() {
	var result = check_appetite();
	if (result != "true"){
	    say(result);
	}else{
	    say("I'm pretty comfortable right now, thank you.");
	}



}
