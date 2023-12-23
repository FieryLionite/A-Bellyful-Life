// Inherit the parent event
event_inherited();

if (met_player){
	notify_time(6, 0, 35, "Jogging with Amber", rmPark, "Park");
}

if (checkAmberEvent()){
	/*time_forward_minutes(60);
	ControlEnv.hours = 7;
	ControlEnv.minutes = 50;
	global.scene_script = amber_jog;
	scene_start();*/
}