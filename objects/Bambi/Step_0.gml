// Inherit the parent event
event_inherited();

if (!met_player && room == rmMapCountryside && ControlEnv.hours < 18){
	global.scene_script = Bambi_intro_scene;
	scene_start();
	exit;
}else if (!met_player && room == rmBarn){
	exelan("msg_Bambi_intro2");
	Bambi.met_player = true;
	Bambi.player_helped = true;
}else if (room == rmBarn && script_location() == rmBarn && !player_helped){
	Bambi.player_helped = true;
	global.scene_script = Bambi_help_scene;
	scene_start();
	exit;
}