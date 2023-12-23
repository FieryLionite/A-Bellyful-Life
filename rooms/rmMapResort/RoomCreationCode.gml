if (ControlEnv.hours > 18 || ControlEnv.hours < 6)
	    set_night_bg();
	else
	    set_day_bg();