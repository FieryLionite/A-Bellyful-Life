// Inherit the parent event
event_inherited();

if (room == rmAlley && !met_player){
	met_player = true;
	has_number = true;
	exelan("msg_Bobbie_intro");
}

if (met_player){
	notify_time(13, 0, 35, "Bobbie's secret shop", rmAlley, "Back Alley - 5pm");
}