if (!visible)
    exit;
    
if (ControlEnv.hours < 21 && ControlEnv.hours > 6){
    dialogue_ok("Error", "It's too early to sleep");
    exit;
}

if (ControlEnv.hours > 21){
    //show_message(string(24 - ControlEnv.hours + 6));
    time_forward_hour(24 - ControlEnv.hours + 6);
}
else
    time_forward_hour(6 - ControlEnv.hours);
    
Player.energy = Player.energy_max;
Player.mood = 100;
Player.shower_times = 0;
	
refresh_location();

