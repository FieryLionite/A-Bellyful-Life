function player_shower(){
	global.scene_name = "Shower";
	global.scene_allow_insert = true;
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	scene_add_actors(Player, noone, noone);
	
	var follower = noone;
	with (Character){
			if (following){
				follower = id;	
			}
	}
	if (false && instance_exists(follower)){
		scene_add_actors(follower.object_index, noone, noone);
	}
	
	background_set(sprBathtubShower);
	global.scene_sound_action = list_create(sndShower);
	
	if (Player.shower_times <= 2){
		change_energy(Player, (Player.energy_max/3) / ((Player.shower_times+1)/2) , true);
		change_mood(Player, 25, true);	
	}
	
	Player.shower_times++;
	
	exelan("msg_player_shower");
	
	with(Player)skew_init(SKEW_ABSOLUTE, 0,0,0,0);
	//with (Player) skew_common();
}

function player_shower_together(){
	global.scene_name = "Shower";
	//global.scene_allow_insert = true;
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	scene_add_actors(Player, noone, noone);
	
	var follower = noone;
	with (Character){
			if (following){
				follower = id;	
			}
	}
	if (instance_exists(follower)){
		scene_add_actors(follower.object_index, noone, noone);
	}
	
	background_set(sprBathtubShower);
	global.scene_sound_action = list_create(sndShower);
	
	if (Player.shower_times <= 2){
		change_energy(Player, (Player.energy_max/3) / ((Player.shower_times+1)/2) , true);
		change_mood(Player, 25, true);	
	}
	
	Player.shower_times++;
	
	exelan("msg_player_shower");
	
	with(Player)skew_init(SKEW_ABSOLUTE, 0,0,0,0);
	//with (Player) skew_common();
}

function player_shower_finish(){
	time_forward_minutes(45);
}

function d_player_shower(){
	global.scene_script = player_shower;
	global.scene_sound_action = list_create(sndShower);
	scene_start();
}

function d_player_shower_together(){
	var follower = get_follower();
	if (follower.likability + follower.lust < 45){
		//ctb_msg("They avoided you as you approach, maybe you should get to know each other a little more.")	
		character_refuse_scene(follower);
		splash_message("Failed likability + lust check (>= 45)");
	}else{
		global.scene_script = player_shower_together;
		global.scene_sound_action = list_create(sndShower);
		follower.lust += 8;
		follower.likability += 4;
		splash_message("likability +4 lust +8");
		scene_start();
	}
}