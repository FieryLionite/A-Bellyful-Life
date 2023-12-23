function player_TV(){
	global.scene_name = "TV";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	background_set(sprLivingroom);
	
	if (Player.TV_times <= 2){
		change_energy(Player, (Player.energy_max/3) / ((Player.TV_times+1)/2) , true);
		change_mood(Player, 20, true)
	}
	
	Player.TV_times++;
	global.scene_sound_action = list_create(sndTV);
	
	exelan("msg_player_TV");
	
	with (Player) skew_common();
}

function player_TV_finish(){
	time_forward_minutes(45);		
}

function d_player_TV(){
	global.scene_script = player_TV;
	
	dialogue_init();
	dialogue_create(
	"1",
	strlan(EN, "Watch TV (45 mins)", RUS, "Смотреть телевизор (45 минут)", JP, "テレビを見る（45分）", CN, "看电视（45 分钟）"),
	true,
	scene_start
	)
	
	dialogue_start(true);
	
}