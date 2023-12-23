function quick_scene_begin(name, script = noone, actors=noone, bg = noone){
	global.quick_scene_name = name;
	if (bg == noone and background_get() != -1)
		bg = background_get();
	global.quick_scene_bg = bg;
	global.quick_scene_actors = actors;
	global.quick_scene_script = script;
	scene_start(quick_scene);
}

function quick_scene(){
	global.scene_name = global.quick_scene_name;
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	
	background_set(global.quick_scene_bg);
	if (global.quick_scene_actors != noone){
			for (var i=0; i < array_length(global.quick_scene_actors); i++){
				scene_add_actors(global.quick_scene_actors[i], noone, noone);	
			}
	}
	if (global.quick_scene_script != noone){
		global.quick_scene_script();
	}
}

function player_sleep(){
	global.scene_name = "Sleep";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	if (global.sleep_with != noone){
		global.sleep_with.likability += 3;
		scene_add_actors(global.sleep_with, noone, noone);
	}
	
	if (global.last_room == rmBedroom){
		background_set(sprBedroomCorner);
	}else
		background_set(sprBedroomResort);
	
	ctb_list(sleep_finish, noone , "z.. z.. z..");
	//sleep_finish();
	with (Player) skew_common();
}

function d_player_sleep_together(){
	var follower = noone;
	with (Character){
			if (following){
				follower = id;	
				following = false;
				visiting = false;
			}
		}
	
	var sleep_ani = asset_get_index("spr" + follower.name + "_Sleep_0");
	if (sleep_ani == -1){
		ctb_msg("Unfortunately the sleeping animation of " + follower.name + " has not beed added  yet :(");
		return;
	}
		
	global.sleep_with = follower;

	with (Character){
			if (visiting || following){
				character_finish_visit(id);
			}
		}
	/*var has_visitor = check_all_for_var(Character, "visiting", true);
	if (has_visitor){
		if (ControlEnv.hours < 23){
			ctb_msg("You have a visitor, please accompany them until the end of their stay first!");
			return;
		}
	}*/
	
	warn_sleep1 = false;
	warn_sleep2 = false;
	
	global.scene_script = player_sleep
	scene_start();
}

function d_player_sleep(){
	global.sleep_with = noone;
	
	with (Character){
			if (visiting || following){
				character_finish_visit(id);
			}
		}
	/*var has_visitor = check_all_for_var(Character, "visiting", true);
	if (has_visitor){
		if (ControlEnv.hours < 23){
			ctb_msg("You have a visitor, please accompany them until the end of their stay first!");
			return;
		}
	}*/
	
	warn_sleep1 = false;
	warn_sleep2 = false;
	
	global.scene_script = player_sleep
	scene_start();
}

function d_player_bed(){
	dialogue_init();
	
	var no_followers = true;
	var follower = noone;
	with (Character){
		if (following) {
			no_followers = false;	
			follower = name;
		}
	}
		
	var sleep = strlan(EN, "Sleep until 6 am",
		RUS, "Спи до 6 утра", JP, "午前6時まで寝る", CN, "睡到早上六点");
		
	var sleep2gether = strlan(EN, "Sleep together until 6 am",
		RUS, "Спать вместе до 6 утра", JP, "朝6時まで一緒に寝る", CN, "一起睡到早上 6 点");

	if !(ControlEnv.hours >= 21 || ControlEnv.hours < 6){
		dialogue_create(
		"1",
		sleep,
		false,
		strlan(EN, "It's still too early. You usually go to bed at around 9pm",
					CN, "现在太早了。你一般晚上9点才去睡觉。",
					JP, "（まだ、眠くない。ベッドで寝たい場合は21時以降になる必要がある）",
					RUS, "Слишком рано. Обычно ты ложишься в кровать около 9 вечера"
				)
		)
		
		/*dialogue_create(
		"2",
		sleep2gether,
		false,
		strlan(EN, "It's still too early. You usually go to bed at around 9pm",
					CN, "现在太早了。你一般晚上9点才去睡觉。",
					JP, "（まだ、眠くない。ベッドで寝たい場合は21時以降になる必要がある）",
					RUS, "Слишком рано. Обычно ты ложишься в кровать около 9 вечера"
				)
		)*/
		
		if (!no_followers)
		dialogue_create(
			"3",
			"Ask if "+follower+" wants a belly massage",
			true,
			function(){
				var follower = get_follower();
				if (follower.lust >= 100 or follower.stress >= 100){
						global.char_massage = follower;
						ctb_list(noone, noone, follower.name + " didn't feel too well");
				}if (follower.likability > 25){
						global.char_massage = follower;
						ctb_list(noone, rmMassage, follower.name + " agreed and laid on the bed, waiting for you to start.");
				}else{
					splash_message("Failed likability check (> 25)")	
					global.char_massage = follower;
					ctb_list(noone, noone, follower.name + " sorry I'm not quite comfortable with that.");
					
				}
			}
			)
	}else {//if (ControlEnv.hours >= 21 || ControlEnv.hours < 6)
		dialogue_create(
		"1",
		sleep,
		true,
		d_player_sleep
		)
		
		
		if (no_followers){
			dialogue_create(
			"2",
			sleep2gether,
			true,
			function(){
				dialogue_init()
				dialogue_create("y", "Yes"	, true, function(){})
				dialogue_create("n", "No"	, true, function(){})
				dialogue_start(true);
				ctb_msg("There's no one with you! You're not going to ask yourself to sleep with yourself.... are you?")
			}
			)	
		}else{
			dialogue_create(
			"2",
			sleep2gether,
			true,
			d_player_sleep_together
			)
			
			
		}
	}
		
	/*dialogue_create(
		"2",
		"Massage belly",
		false,
		"Incomplete Scene"
		//d_player_massage
		)*/
	
	dialogue_start(true);
}

function sleep_finish(){
//var temp = Player.hours_without_eating;
	/*if (ControlEnv.hours > 21){
    //show_message(string(24 - ControlEnv.hours + 6));
	    time_forward_hour(24 - ControlEnv.hours + 6);
	}
	else
	    time_forward_hour(6 - ControlEnv.hours);*/
	
	time_forward_minutes(6*60);
	ControlEnv.hours = 6;
	ControlEnv.minutes = 10;
	
	with (Character){
		//hardcoded
	//if (weight_next != -1 && weight >= weight_next){
	//	weight_next = -1;
	//	fat_level ++;
	//}
		
	var mult = 300;
	if (object_index != Player)
		mult = 200;
	
	////////////////////////////////
	inc_stomach = (daily_stomach_content/daily_minutes)*mult;
	inc_bowels = (daily_bowels_content/daily_minutes)*mult;
	
	//show_message(str(inc_stomach) + " =( " + str(daily_stomach_content) + "/" + str(daily_minutes)+")*" + str(mult));
	//show_message(str(inc_bowels) + " =( " + str(daily_bowels_content) + "/" + str(daily_minutes)+")*" + str(mult));
	//inc_stomach = 0;
	//inc_bowels = 0;
	
		//ctb_list(noone, noone, string(inc_stomach) + ", " + string(inc_bowels));
	stomach_capacity += inc_stomach;
	bowels_capacity += inc_bowels;
	
	////////////////////////////////
	daily_stomach_content = 0;
	daily_bowels_content = 0
	daily_minutes = 0;
	
	today_hug = false;
	today_hickey = false;
	today_watched_inflate = false;
	
	lust = 0;
	}
	
	if (Player.pool_pass > 0)
		Player.pool_pass --;
    
	//Player.hours_without_eating  = temp;
	Player.energy = Player.energy_max;
	with (Character){
			jittery = 0;
			alcohol = 0;
			visited = false;
			if (object_index != Player){
					
			}
	}
	Player.mood = 100;
	Player.shower_times = 0;
	Player.TV_times = 0;
	Player.warn_sleep1 = false;
	Player.warn_sleep2 = false;
	
	//if (daily_calories < 0)
	var last_fat = Player.fat_calories,
		msg_weight = "", msg_capacity = "";
	Player.fat_calories += Player.daily_calories;
	
	if (Player.daily_calories> 0)
		msg_weight = strlan(
										EN,"You gained some weight.",
										CN, "你增加了一些体重",
										JP, "体重が増えました。",
										RUS, "Ты набрала немного вес."
									);
	else if (Player.daily_calories < 0)
		msg_weight = strlan(
										EN, "You lost some weight.",
										CN, "你体重掉了一些",
										JP, "体重が減りました。",
										RUS, "Ты сбросила немного вес."
									);
		
	msg_capacity = strlan(
										EN, "Your stomach capacity increased by ",
										CN, "你的腹部容量增加了",
										JP, "胃の容量が増えました。",
										RUS, "Вместимость твоего желудка увеличилась на"
									) + string(Player.inc_stomach) 
									+ "cc. " + 
									strlan(
										EN, "Your bowels capacity increased by ",
										CN, "你的肠内容量增加了",
										JP, "腸内の容量が増えました。",
										RUS, "Вместимость твоего кишечника увеличилась на"
									) + string(Player.inc_bowels) + "cc.";
	var script = noone;
	//if (ControlEnv.resort_days > 0 && global.last_room == rmBedroom)
	if (ControlEnv.go_resort)
		script = resort_trigger;
	ctb_list(script, noone,
		msg_weight, msg_capacity	
	)
	
	/*if (ControlEnv.resort_days <= 0 && global.last_room == rmBedroomResort)
		script = resort_return_trigger;
	ctb_list(script, noone,
		msg_weight, msg_capacity	
	)*/
	
	FatbucksCashier.last_cancelled --;	
	FataurantCashier.last_cancelled --;	
	FatdonaldsCashier.last_cancelled --;	
	
	Yumi.gave_exam_today = false;
	Amber.jogged_today = false;
	Bambi.player_helped = false;
	
	ControlEnv.battery = 30*60*3;
	with(Character){
		status_notify[? "pill_diet" ] = 15;
		status_notify[? "pill_digest" ] = 15;
		status_notify[? "pill_gas" ] = 15;
		status_notify[? "pill_noise" ] = 15;
		status_notify[? "pill_laxative" ] = 15;
	}
	
	coins_reset();
	
	//if (ControlEnv.resort_days  > 0)
		//ControlEnv.resort_days--;
	//custom_goto(rmBedroom);
}

function d_player_massage(){
	
}

function resort_trigger(){
		if (ControlEnv.resort_days > 0 && global.last_room == rmBedroom){
			ds_list_clear(global.scene_actors);
		global.last_room = rmBedroomResort;	
		ButtonMap.last_map = rmMapResort;
		//global.scene_name = "Back";
		ctb_list(noone, noone, "[speaker:noone][set_background:sprPacking]You woke up early at 4am to finalize your luggage.",
				"[set_background:sprAirport]You arrived just in time before your flight leaves for the resort.")
	}else if (ControlEnv.resort_days <= 0 && global.last_room != rmBedroom){
		ds_list_clear(global.scene_actors);
		ctb_list(noone, noone, "[speaker:noone]You woke up early at 4am to finalize your luggage.",
				"[set_background:sprAirport]You arrived just in time before your flight leaves for home.")
		global.last_room = rmBedroom;	
		ControlEnv.go_resort = false;
		with (Character) go_resort = false;
		ButtonMap.last_map = rmMapUni;
	}
	ControlEnv.resort_days--;
	btArrowNavi.target_room = global.last_room;
}

/*function resort_return_trigger(){
		if (ControlEnv.resort_days > 0 && global.last_room == rmBedroom){
			ds_list_clear(global.scene_actors);
		global.last_room = rmBedroomResort;	
		ButtonMap.last_map = rmMapUni;
		//global.scene_name = "Back";
		ctb_list(noone, noone, "[speaker:noone][set_background:sprPacking]You woke up early at 4am to finalize your luggage.",
				"[set_background:sprAirport]You arrived just in time before your flight leaves for home.")
			global.last_room = rmBedroom;	
		ControlEnv.go_resort = false;
		with (Character) go_resort = false;
		ButtonMap.last_map = rmMapUni;
	}else if (ControlEnv.resort_days <= 0 && global.last_room != rmBedroom){
		global.last_room = rmBedroom;	
		ControlEnv.go_resort = false;
		with (Character) go_resort = false;
		ButtonMap.last_map = rmMapUni;
	}
	
	btArrowNavi.target_room = global.last_room;
}*/