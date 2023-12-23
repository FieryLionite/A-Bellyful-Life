function d_bathroom_toilet(){
	global.scene_script = player_bathroom_sink;
	dialogue_init();
	dialogue_create(
	"1",
	strlan(EN, "Do your business", RUS, "Сходить в туалет", JP, "トイレに行く", CN, "去洗手间"),
	true,
	player_expel
	)
	
	dialogue_start(true);
}

function player_bathtub(){
	global.scene_name = "Bathtub";
	background_set(sprBathtubHose);
	
	if (global.last_room == rmBathroomResort){
		global.scene_name = "ResortTub";	
		background_set(sprBathtubResort);
	}
	
	global.scene_inflate_rate = 2;
	global.allow_stream = true;
	scene_add_actors(Player, ANAL, WATER);
	scene_auto_sound(ANAL, WATER);

	global.scene_do_breath = true;
	global.scene_sound_action = list_create(sndFlowWater);
	with (Player) skew_common();
	
	repulsed_message();
}

function d_bathtub(){
	global.scene_script = player_bathtub;
	
	dialogue_init();
	dialogue_create(
	"1",
	strlan(EN, "Take a Shower (45 mins)", RUS, "Принять душ (45 минут)", JP, "シャワーを浴びる（45分）", CN, "淋浴（45 分钟）"),
	true,
	//scene_start
	d_player_shower
	)
	
	var follower = get_follower();
	if (instance_exists(follower))
		dialogue_create(
		"1a",
		strlan(EN, "Shower Together (45 mins)", RUS, "Душ вместе (45 минут)", JP, "一緒にシャワーを浴びる（45分）", CN, "共浴（45 分钟）"),
		true,
		d_player_shower_together
		)
	
	dialogue_create(
	"2",
	str_unhook,
	true,
	scene_start
	)
	
	if (Yumi.following)
		dialogue_create(
			"3",
			"Ask Yumi to unhook shower hose",
			true,
			Yumi_ask_bathtub
		)
		
	if (Bobbie.following)
		dialogue_create(
			"3",
			"Ask Bobbie to unhook shower hose",
			true,
			Bobbie_ask_bathtub
		)
		
	if (Remi.following)
		dialogue_create(
			"3",
			"Ask Remi to unhook shower hose",
			true,
			Remi_ask_bathtub
		)
	
	dialogue_start(true);
}

function player_bathroom_sink(){
	global.scene_name = "BathroomSink";
	global.scene_inflate_rate = 2;
	global.allow_stream = true;
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
	scene_add_actors(Player, ORAL, WATER);
	scene_auto_sound(ORAL, WATER);
	background_set(sprBathroomSink);
	
	with (Player) skew_common();
}

function d_bathroom_sink(){
	global.scene_script = player_bathroom_sink;
	
	dialogue_init();
	dialogue_create(
	"Drink",
	str_drink,
	true,
	scene_start
	)
	
	dialogue_create(
	"Throw up",
	str_throwup,
	true,
	player_throw_up
	)
	
	dialogue_start(true);
}

function d_bathtub_resort(){
	global.scene_script = player_bathtub;
	
	dialogue_init();
	/*dialogue_create(
	"1",
	"Take a Shower (45 mins)",
	true,
	//scene_start
	d_player_shower
	)*/
	
	dialogue_create(
	"2",
	str_unhook,
	true,
	scene_start
	)
	
	if (Aria.go_resort)
		dialogue_create(
			"3",
			"Ask Aria to unhook shower hose",
			true,
			Aria_ask_resortbathtub
		)
		
	
	dialogue_start(true);
}