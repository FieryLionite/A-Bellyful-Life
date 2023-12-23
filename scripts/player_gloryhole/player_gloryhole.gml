function player_gloryhole(){
	global.scene_name = "BJ";
	global.scene_inflate_rate = 1;
	global.allow_stream = true;
	scene_add_actors(Player, ORAL, WATER);
	scene_auto_sound(ORAL, WATER);
	background_set(bgBJ);
	global.scene_sound_action = list_create(sndSwallowWater);
	global.scene_do_breath = true;
	with (Player) skew_common();
	repulsed_message();
	
	with(Player)skew_init(SKEW_ABSOLUTE, 20, 0, 0.2, true);
}