// Inherit the parent event
event_inherited();

if (player_registered && !check_day(SAT, SUN)){
	var start_hour = (player_shift==1)? 7 :( (player_shift==2)? 12 : 17);
	
	notify_time(start_hour, 0, 35, "Part Time Job", rmFatdonalds, "Fatdonalds");
	
	var curr_hour = ControlEnv.hours;
	//work!
	if (room == rmFatdonalds && curr_hour >= start_hour && curr_hour < start_hour+5){
		var late = !check_time(start_hour, 30, 35),
			minutes_worked  = round(get_minutes_span(curr_hour, ControlEnv.minutes, start_hour+5, 0)),
			earned = ceil((minutes_worked/60)*11), //$12 an hour
			msg = "You earned " + string(earned) + " $ in "  + string(minutes_worked) + " minutes.";
			
			if (late){
				msg += " Subtract $" +string( round(earned * 0.2)) + " for being late.";
				earned *= 0.8;
			}
			
		ControlEnv.money += round(earned);
		change_energy(Player, -(minutes_worked/60)*8, true); //8 energy per hour
		change_mood(Player,  -(minutes_worked/60)*12, true); 
		
		time_forward_minutes(minutes_worked);
		
		audio_play_sound(sndWork,0,0);
		global.stop_sound = sndWork;
		ctb_list(audio_stop_sound_later, noone, "...", "...", msg);
	}
}