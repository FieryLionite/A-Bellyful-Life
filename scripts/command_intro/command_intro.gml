function command_intro() {
	var bg = noone;
	switch( argument[0] ) {
	    case "class": bg = bgIntroClass; break;
	    case "drought": bg = bgIntroDrought; break;
	    case "woh": bg = bgIntroWoH; break;
	    case "lab": bg = bgIntroLab; break;
	    case "code": bg = bgIntroCode; break;
	    case "war": bg = bgIntroWar; break;
	    case "workshop": bg = bgIntroWorkshop; break;
	    default: //show_message("bg not found in intro"); break;
	}

	if (bg != noone)
	    __background_set( e__BG.Index, 0, bg );



}
