function profile_fr() {
	var p = global.patient;

	if (ControlProfile.fat < p.fat_level){
	    if (ControlProfile.belly <2)
	        ControlProfile.belly ++;
	}else{
	    if (ControlProfile.belly <p.belly_size)
	        ControlProfile.belly ++;
	}




}
