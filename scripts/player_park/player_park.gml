/*function player_park(){
	global.scene_name = "Park";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	background_set(sprPark);
	
	var msg_finish_jog = strlan(
				EN, "You began jogging through the park. You can feel the refreshing air lifting your mood.",
				CN, "你开始在公园中慢跑。清凉的空气改善了你的心情。",
				JP, "公園をジョギングし始めた。爽やかな空気が気分を良くしてくれます。",
				RUS, "Ты начала бегать по парку. Ты можешь почувствовать, как освежающий воздух поднимает твое настроение."
			);
	///////FIX
	global.dialogue_char = Amber;
	if (script_execute(Amber.script_location) != rmPark)
		ctb_list(player_jog_finish, noone , 
			msg_finish_jog
		);
	else{
		global.dialogue_char = noone;
		global.scene_script = amber_jog;
		if (!Amber.met_player)
			ctb_list(room_restart, noone , msg_finish_jog, 
				strlan(EN, "During your jog, you noticed another girl up ahead. You both matched each other's pace.",
					CN, "慢跑的时候，你看到前面有一个女孩也在跑步，你们慢慢步调一致起来。",
					JP, "ジョギング中に、女の子が前を歩いている。あなたがペースを合わせると一緒にペースを合わせて歩いてくれました。",
					RUS, "Во время пробежки ты заметила впереди другую девушку. Вы поравнялись друг с другом."
				)
			);
		else{
			room_restart();	
		}
	}
//	with (Player) skew_common();
}*/

function player_park(){
	global.scene_name = "Park";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	//scene_add_actors(Player, noone, noone);
	//background_set(sprPark);
	
	var msg_finish_jog = strlan(
				EN, "You began jogging through the park. You can feel the refreshing air lifting your mood.",
				CN, "你开始在公园中慢跑。清凉的空气改善了你的心情。",
				JP, "公園をジョギングし始めた。爽やかな空気が気分を良くしてくれます。",
				RUS, "Ты начала бегать по парку. Ты можешь почувствовать, как освежающий воздух поднимает твое настроение."
			);
	///////FIX
	global.dialogue_char = Amber;
	if (!Amber.met_player){
			background_set(bgAmberMeet);
			Amber.met_player = true;
			Amber.has_number = true;
			ctb_list(noone, noone , msg_finish_jog, 
				"[speaker:noone]As you go along, you see a girl with bright orange hair and freckles sitting on a park bench.",
				"You decide that now would be a good time to take a break, and have a seat next to the new girl.",
				"After only a few moments of silence, the girl addresses you.",
				"[speaker:Amber]Going for a morning jog, huh?",
				"[speaker:Player]Yeah! I just moved here, so I figured I’d look around, see what there is to see.",
				"[speaker:Amber]Well, spoiler alert, you won’t see much more than trees, squirrels, and old people around here.",
				"[speaker:noone]The two of you share a laugh.",
				"[set_background:bgAmberMeet2][speaker:Amber]My name’s Amber, by the way. Nice to meet you!",
				"[speaker:noone]Amber reaches out, gesturing for you to shake her hand.",
				"[set_background:bgAmberMeet3][speaker:Player]My name is—YIKES!!!",
				"[speaker:noone]As you take Amber’s hand, you feel a jolt in your arm and instinctively recoil.",
				"Amber begins laughing, and you look down to see what appears to be a joy buzzer in her hand.",
				"[set_background:bgAmberMeet4]You let out a sigh of relief and chuckle a little bit, now aware that you’ve been pranked.",
				"[speaker:Amber]Gotcha!",
				"[speaker:noone]She seems a little too proud of her handiwork, but you can’t help but appreciate how flawless her prank was.",
				"[speaker:Player]Yeah, you got me good. ",
				"[speaker:Amber]Sorry if I scared you. I don’t normally prank people I’ve just met, but I just couldn’t help myself.",
				"[set_background:bgAmberMeet][speaker:Player]Hey, I like pranks as much as the next guy.",
				"[speaker:Amber]That’s good, I guess. Not too many people can appreciate a good prank.",
				"[speaker:noone]Amber gets up off the bench and turns around to face you, a warm smile on her face.",
				"[speaker:Amber]Do you wanna come jogging with me?",
				"[speaker:noone]You eye her suspiciously",
				"[speaker:Amber]Don’t worry, I’m not going to prank you while we’re jogging. Promise.",
				"[speaker:Player]If you say so, haha.",
				"[speaker:noone]You and Amber have a nice jog through the Park, chatting and laughing the whole way.",
				"[speaker:Amber]It’s nice to have someone to jog with in the morning.",
				"[speaker:Player]Same! Talking makes jogging a lot more fun.",
				"[speaker:Amber]We should do this more often.",
				"[speaker:Player]ditto",
				"[speaker:noone]You now have Amber’s phone number.",
				"Amber puts her phone in her back pocket.",
				"[speaker:Amber]I jog here every morning, six to eight.",
				"[speaker:Player]I may not come here every morning, but I’ll try my best!",
				"[speaker:noone]With that, the two of you part ways.",
				"You glance down at your phone, happy that your contact list is one entry longer.",
				"You also can’t help imagining yourself pranking Amber in your own way.",
				"Something involving using a hose to make her belly expand.",
				"With a grin, you walk out of the Park and take on the rest of your day."
			);
			
	}else{
		scene_add_actors(Player, noone, noone);
		background_set(sprPark);
		
		if (script_execute(Amber.script_location) != rmPark)
			ctb_list(player_jog_finish, noone , 
				msg_finish_jog
			);
		else{
			global.dialogue_char = noone;
			global.scene_script = amber_jog;
			room_restart();	
		}
	}
//	with (Player) skew_common();
}

function d_player_park(){
	dialogue_init();
	var str_jog = strlan(EN, "Jog for", RUS, "Бег трусцой", JP, "ジョグ", CN, "慢跑");
	dialogue_create(
	"1",
	str_jog + " 20 " + str_mins,
	true,
	d_player_jog20
	)
	
	dialogue_create(
	"2",
	str_jog + " 40 " + str_mins,
	true,
	d_player_jog40
	)
	
	dialogue_create(
	"3",
	str_jog + " 60 " + str_mins,
	true,
	d_player_jog60
	)
	dialogue_start(true);
}

function  d_player_jog20(){
	d_player_jog(20);
}

function  d_player_jog40(){
	d_player_jog(40);
}

function  d_player_jog60(){
	d_player_jog(60);
}

function player_jog_start(){
	global.scene_script = player_park;
	scene_start();
}

function player_jog_energy(minutes){
	var cost = -minutes/2,
	fraction =  (Player.total_content/Player.total_capacity);
	energy_charge =fraction*cost + cost;
	if (change_energy(Player, energy_charge, false) == -1){
		ctb_list(noone, noone, "You're too tired!");
		return;
	}
	change_mood(Player, -energy_charge, true);
	
	
	global.player_increase_endurance =  -energy_charge/1000;
	global.player_jog_minutes = minutes;
	player_jog_start();
}

function d_player_jog(minutes){
	player_jog_energy(minutes);
	
	
}

function player_jog_finish(){
	time_forward_minutes(global.player_jog_minutes);
	exelan("msg_player_jog_finish");
	
	
}