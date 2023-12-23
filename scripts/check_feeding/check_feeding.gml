/// @description check_feeding(food)
/// @param food
function check_feeding(argument0) {
	var food = argument0;
	var patient = global.patient;
	var result = check_appetite();
	if (result != "true"){
	    say(result);
	    return false;
	}

	if (patient.craving == food.item){
	    return true;
	}else{
	    say(choose("Could you order some " + patient.craving.name + " instead?",
	            "Do you have any " + patient.craving.name + ", I'm craving them a lot right now.",
	            "I would really like some " + patient.craving.name + ", could you save that for later?"));
	    return false;
	}





}
