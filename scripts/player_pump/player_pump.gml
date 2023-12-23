function player_pump(){
	switch(global.last_room){
		case rmPark:
		case rmDowntown:
		case rmPool:
		case rmFataurant:
		case rmFatdonalds:
		case rmFatbucks:
			instance_create_depth(0,0, ControlScene.depth - 1, AlertCaught);
			break;
	}
	
	global.scene_name = "Pump";
	global.scene_inflate_rate = 2;
	global.allow_stream = true;
	
	background_set(global.pump_bg);
	global.scene_sound_action = list_create(sndAirpump);
	global.scene_do_breath = true;
	if (global.pump_type == 0){
		scene_add_actors(Player, ORAL, AIR);
		scene_auto_sound(ORAL, AIR);
		
		global.scene_fg = sprPlayerPumpFront;
	}else if  (global.pump_type == 1){
		scene_add_actors(Player, ANAL, AIR);
		scene_auto_sound(ANAL, AIR);
		global.scene_fg = sprPlayerPumpBack;
	}
	
	with (Player) skew_common();
}

function pump_caught_check(){
	return false;
}

function player_pump_mouth(){
	if (pump_caught_check())
		return;
	
	global.pump_type = 0;
	global.scene_script = player_pump;
	scene_start();
}

function player_pump_butt(){
	if (pump_caught_check())
		return;
		
	global.pump_type = 1;
	global.scene_script = player_pump;
	scene_start();
}

function d_player_pump(){
	if (!is_location_room(global.last_room) || room == rmShop){
		ctb_msg("You can't use this here, so many people are around!");
		return;
	}
	
	global.pump_bg = global.last_bg;
	
	dialogue_init();
	dialogue_create(
	"1",
	"Pump mouth",
	true,
	player_pump_mouth
	)
	
	dialogue_create(
	"2",
	"Pump butt",
	true,
	player_pump_butt
	)
	
	dialogue_start(true);
}