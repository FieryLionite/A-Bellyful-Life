
function player_greenhouse(){
	global.scene_name = "Greenhouse";
	global.scene_inflate_rate = 2;
	global.allow_stream = true;
	scene_add_actors(Player, ANAL, WATER);
	scene_auto_sound(ANAL, WATER);
	background_set(sprGreenhouseScene);
	global.scene_sound_action = list_create(sndFlowWater);
	global.scene_do_breath = true;
	with (Player) skew_common();
	repulsed_message();
}

function d_greenhouse(){
	global.scene_script = player_greenhouse;
	
	dialogue_init();
	dialogue_create(
	"1",
	strlan(EN, "Use hose", RUS, "Использовать шланг", JP, "ホースを使用する", CN, "使用软管"),
	true,
	scene_start
	)
	
	if (Amber.following){
		dialogue_create(
		"2",
		"Ask Amber to use hose",
		true,
		Amber_ask_garden
		)
	}
	dialogue_start(true);
}