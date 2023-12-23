/// @description time_forward(minutes)
/// @param minutes
function time_forward_hour(argument0) {
	var hours = ceil(argument0);
	if (Player.alcohol >= 30 && floor(random(100) <= Player.alcohol)) {
		hours *= Player.alcohol/100 + 1
		hours = ceil(hours);
		ControlEnv.blur = random_range(Player.alcohol/2, Player.alcohol);
	}
	
	Player.daily_calories -= Player.hourly_calories_uptake * hours;
	global.temp = hours*60;
	
	with (Character)
		character_tick(global.temp);
		
	with (Item){
		if (script_tick != noone)
			script_tick(hours*60);
	}
	
	ControlEnv.raining -= min(ControlEnv.raining, hours*60);
		
	with (Item){
		if (!is_template && do_expire){
				if (!in_fridge)
					expire_in -= global.temp;
				else
					expire_in -= global.temp/5;
		}
	}
	
		
	tick_all(hours);

	ControlEnv.hours += hours;
	Player.hours_without_eating += hours;

	if (ControlEnv.hours >= 24){
	    carry_over = ControlEnv.hours - 24;
	    ControlEnv.day++;
	    ControlEnv.hours = carry_over;
	}

	refresh_location();

	var rain_chance = hours/20;
	if (random(1) <= rain_chance){
		ControlEnv.raining += random_range(30, 240);	
	}

}
