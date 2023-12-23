/// @description feed (calories, weight, type)
/// @param calories
/// @param  weight
/// @param  type
function feed(argument0, argument1, argument2) {
	var calories = argument0;
	var weight = argument1;
	var type = argument2;
	var patient = global.patient;

	if (floor(random(3)) == 0)
	    say(msg_enjoy());
    
	if (floor(random(3)) == 0){
	    patient = global.patient;
	    mx = PatientHolder.x - patient.mouth_x;
	    my = PatientHolder.y - patient.mouth_y;
    
	    instance_create(mx + random_range(-10,10), 
	        my + random_range(-10,10), 
	        Smear);
	}

	patient.weight_delta += weight;
	patient.calories += calories;

	if (type == "solid"){
	    audio_play_sound(choose(chew1,chew2,chew3,chew4),0, false);
	}else if (type == "liquid"){
	    audio_play_sound(choose(swallow1,swallow2,swallow3,swallow4),0, false);
	}

	//show_message(string(weight) + ", " + string(patient.weight_delta) + "/" +string(patient.weight*(0.03 * (patient.fat_level+1)))); 
	if(patient.weight_delta >= patient.weight*(0.03 * (patient.fat_level+1))){
	    patient.weight += patient.weight_delta;
	    patient.weight_delta = 0;
	    patient.belly_size ++;
	    if (patient.belly_size > 2){
	        patient.belly_size = 2;
	        patient.bite_rate *= 0.7;
	        global.session_finished = true;
	        say(msg_finish());
	        burp();
	        return true;
	    }
	    say (msg_pressure(), true);
	//    patient.needs_rubbing = true;
	    pressure_create();
    
	}

	if (floor(random(global.change_chance)) == 0)
	    patient.craving = pick_craving();
    
	return true;



}
