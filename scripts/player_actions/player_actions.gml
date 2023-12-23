function player_throw_up(){
	sndVomit = get_random_asset("sndVomit", 1, 5);
	if (global.settings[? "vomit sound"])
		audio_play_sound(sndVomit, 0, 0);
	change_energy(Player, -5, true);
	//Player.stomach_content -= min(Player.stomach_capacity/5,Player.stomach_content);
	Player.stomach_air *= 0.5;
	Player.stomach_water *= 0.5;
	Player.stomach_food *= 0.5;
	Player.stomach_pressure *=0.5;
	
	//if (Player.stomach_content < 0)
	//	Player.stomach_content = 0;
}

function character_throw_up(char){
	sndVomit = get_random_asset("sndVomit", 1, 5);
	if (global.settings[? "vomit sound"])
		audio_play_sound(sndVomit, 0, 0);
	//Player.stomach_content -= min(Player.stomach_capacity/5,Player.stomach_content);
	char.stomach_air *= 0.5;
	char.stomach_water *= 0.5;
	char.stomach_food *= 0.5;
	char.stomach_pressure *=0.5;
}

function player_expel(){
	audio_play_sound(sndFlush, 0, 0);
	change_energy(Player, -5, true);
	Player.bowels_air *= 0.5;
	Player.bowels_water *= 0.5;
	Player.bowels_food *= 0.5;
	Player.bowels_pressure *=0.5;
	//if (Player.stomach_content < 0)
	//	Player.stomach_content = 0;
}

function character_expel(char){
	audio_play_sound(sndFlush, 0, 0);
	
	char.bowels_air *= 0.5;
	char.bowels_water *= 0.5;
	char.bowels_food *= 0.5;
	char.bowels_pressure *=0.5;
	//if (Player.stomach_content < 0)
	//	Player.stomach_content = 0;
}