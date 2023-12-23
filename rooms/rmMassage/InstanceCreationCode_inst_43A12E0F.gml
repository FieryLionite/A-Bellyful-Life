//target_room = rmBedroom;
target_script = function(){
	char = global.char_massage;
	var lustInc = ControlMassage.lustInc;
	char.likability += lustInc/10;
	var libInc = lustInc/7;
	//if (lustInc >= 70)
	//	libInc *= 1.5;
		
	char.libido += libInc;
	
	
	ctb_list(noone, rmBedroom, "Libido +" + string(libInc) + ", Likability +" + string(lustInc/10));
}