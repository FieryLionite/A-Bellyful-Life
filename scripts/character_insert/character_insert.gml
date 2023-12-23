function character_insert(){
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
	
	global.scene_name = "Insert";
	global.scene_inflate_rate = 1.5;
	global.allow_stream = true;
	global.scene_sound_action = list_create();
	background_set(global.pump_bg);
	//global.scene_sound_action = list_create(sndAirpump);
	global.scene_do_breath = true;
	global.scene_allow_insert = true;
	
	scene_add_actors(global.dialogue_char, noone, noone);
}