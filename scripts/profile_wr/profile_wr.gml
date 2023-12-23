function profile_wr() {
	var p = global.patient;
	ControlProfile.fat ++;
	if (ControlProfile.fat > p.fat_level)
	    ControlProfile.fat = p.fat_level;
    
	ControlProfile.belly = 0;



}
