//x = 0;
//y = 0;
sprite_index = sprGloryHoleOutline;

target_script = function(){
	
	dialogue_init();
	dialogue_create(
	"1",
	strlan(EN, "Give blowjobs to random people", RUS, "Делать минет случайным людям", JP, "不特定多数の人にフェラチオをする", CN, "随便给人口交"),
	true,
		function(){
			global.scene_script = player_gloryhole;
			scene_start();
		}
	)
	
	dialogue_start(true);
};

function player_gloryhole(){
	//show_message("HERE");
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
}