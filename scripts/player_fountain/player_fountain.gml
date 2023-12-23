function player_fountain(){
	global.scene_name = "Fountain";
	global.scene_inflate_rate = 2;
	global.allow_stream = true;
	scene_add_actors(Player, ANAL, WATER);
	scene_auto_sound(ANAL, WATER);
	background_set(sprFountainNoSpray);
	global.scene_sound_action = list_create(sndFlowWater);
	global.scene_do_breath = true;
	with (Player) skew_common();
	instance_create_depth(0,0, ControlScene.depth - 1, AlertCaught);
	
	//repulsed_message();
}


function d_player_fountain(){
	global.scene_script = player_fountain;
	
	dialogue_init();
	dialogue_create(
	"1",
	strlan(EN, "Sit on fountain", RUS, "Сесть на фонтан", JP, "噴水に座る", CN, "坐在喷泉上"),
	true,
	scene_start
	)
	dialogue_start(true);
}