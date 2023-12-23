function pressure_create() {
	burp();
	girl = global.patient;
	for (i = 0; i < 2; i ++){
	    belly_x = PatientHolder.x - girl.belly_x;
	    belly_y = PatientHolder.y - girl.belly_y;
	    xx = -1000;
	    yy = -1000;
    
	    while (!instance_place(xx,yy, PatientHolder)){
	    xx = belly_x + random_range(-45,45);
	    yy = belly_y + random_range(-45,45);
	    }
	    //show_message(string(xx) + ", " + string(yy));
	    instance_create(xx,yy,Blockage);
	}



}
