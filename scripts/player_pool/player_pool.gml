function player_pool(){
	global.scene_name = "Swim";
	background_set(sprPlayerSwimBG);
	
	if (global.last_room == rmPoolResort){
		global.scene_name = "ResortPool";
		background_set(sprPoolSideResort);
			if (Aria.go_resort)
				scene_add_actors(Aria, noone, noone);
	}
	
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	scene_add_actors(Player, noone, noone);
		
	ctb_list(player_swim_finish, noone , 
	strlan(EN, "You began swimming earnessly. You can feel the refreshing water lifting your mood.",
			CN, "你开始认真地游泳，清爽的感觉令你心情有所改善。",
			JP, "あなたは夢中で泳ぎ始めました。水の心地よさが気分を高揚させているのを感じます。",
			RUS, "Ты начала интенсивно плавать. Ты можешь почувствовать, как освежающая вода поднимает настроение."
		)
	);
//	with (Player) skew_common();
}

function d_player_pool_enter(){
	if (Player.pool_pass > 0){
		return;
	}
	
	dialogue_init();
	dialogue_create(
	"1",
	strlan(EN, "Buy a day pass for $7", RUS, "Купите дневной абонемент за 7 долларов", JP, "1日パスを7ドルで購入", CN, "花 7 美元购买一日通行证"),
	true,
	d_player_day_pass
	)
	
	dialogue_create(
	"2",
	strlan(EN,"Buy a week pass for $35", RUS, "Купите недельный абонемент за 35 долларов", JP, "ウィークパスを35ドルで購入", CN, "以 35 美元购买周票"),
	true,
	d_player_week_pass
	)
	
	dialogue_create(
	"3",
	strlan(EN, "Leave", RUS, "Оставлять", JP, "離れる", CN, "离开"),
	true,
	d_player_pool_leave
	)

	dialogue_start(false);
}

function d_player_day_pass(){
	ControlEnv.money -= 7;
	Player.pool_pass ++;
	LocationInteract.image_alpha = 1;
}

function d_player_week_pass(){
	ControlEnv.money -= 35;
	Player.pool_pass += 7;
	LocationInteract.image_alpha = 1;
}

function d_player_pool_leave(){
	custom_goto(rmMapUni);
}

function d_player_pool(){
	dialogue_init();
	var str_swim = strlan(EN, "Swim for", RUS, "Плавать", JP, "泳ぐ", CN, "游泳");
	dialogue_create(
	"1",
	str_swim + " 20 " + str_mins,
	true,
	d_player_swim20
	)
	
	dialogue_create(
	"2",
	str_swim + " 40 " + str_mins,
	true,
	d_player_swim40
	)
	
	dialogue_create(
	"3",
	str_swim + " 60 " + str_mins,
	true,
	d_player_swim60
	)
	dialogue_start(true);
}

function  d_player_swim20(){
	d_player_swim(20);
}

function  d_player_swim40(){
	d_player_swim(40);
}

function  d_player_swim60(){
	d_player_swim(60);
}

function player_swim_start(){
	global.scene_script = player_pool;
	scene_start();
}

function d_player_swim(minutes){
	var cost = -minutes/2,
	fraction =  (Player.total_content/Player.total_capacity);
	energy_charge =fraction*cost + cost;
	if (change_energy(Player, energy_charge, false) == -1){
		ctb_list(noone, noone, "You're too tired!");
		return;
	}
	change_mood(Player, -energy_charge, true);
	
	
	global.player_increase_endurance =  -energy_charge/1000;
	global.player_swim_minutes = minutes;
	
	player_swim_start();
}

function player_swim_finish(){
	time_forward_minutes(global.player_swim_minutes);
	if (global.last_room != rmPoolResort)
		exelan("msg_player_swim_finish");
}


