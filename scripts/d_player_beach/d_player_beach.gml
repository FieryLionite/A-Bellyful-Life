function player_beach(){
	global.scene_name = "Beach";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	scene_add_actors(Player, noone, noone);
	background_set(sprBeachZoomed);
	
	if (Aria.go_resort){
		scene_add_actors(Aria, noone, noone);
	}
		
	ctb_list(player_beach_finish, noone , 
	strlan(EN, "You and Aria played to your heart's content. You can feel the refreshing ocean air lifting your mood.",
			CN, "你开始认真地游泳，清爽的感觉令你心情有所改善。",
			JP, "あなたは夢中で泳ぎ始めました。水の心地よさが気分を高揚させているのを感じます。",
			RUS, "Ты начала интенсивно плавать. Ты можешь почувствовать, как освежающая вода поднимает настроение."
		)
	);
//	with (Player) skew_common();
}



function d_player_beach(){
	if (!Aria.go_resort){
		dialogue_ok("Hmm", "You don't feel like playing on the beach alone, maybe invite someone next time?");
		exit;
	}
	
	dialogue_init();
	
	dialogue_create(
	"1",
	"play for 20 minutes",
	true,
	d_player_beach20
	)
	
	dialogue_create(
	"2",
	"play for 40 minutes",
	true,
	d_player_beach40
	)
	
	dialogue_create(
	"3",
	"play for 60 minutes",
	true,
	d_player_beach60
	)
	dialogue_start(true);
}

function  d_player_beach20(){
	d_player_beach_min(20);
}

function  d_player_beach40(){
	d_player_beach_min(40);
}

function  d_player_beach60(){
	d_player_beach_min(60);
}

function player_beach_start(){
	global.scene_script = player_beach;
	scene_start();
}

function d_player_beach_min(minutes){
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
	
	player_beach_start();
}

function player_beach_finish(){
	time_forward_minutes(global.player_swim_minutes);
	//if (global.last_room != rmPoolResort)
		//exelan("msg_player_swim_finish");
}


