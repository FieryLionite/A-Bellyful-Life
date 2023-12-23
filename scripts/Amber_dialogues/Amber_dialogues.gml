function Amber_dialogues(){
	dialogue_init()
	if (Amber.met_player && in_house())
		dialogue_create(
		        "1",
		       strlan(EN, "Let's go jogging!", 
						RUS,  "Давай пробежимся!",
						CN,"我们一起去跑步吧！",
						JP,  "ジョギングに行こ！"
					),
		        true,
				amber_more_jog
		)
	
	eating_out_ask(Amber);
	
	dialogue_start(true);
	
	ctb_list(noone, noone, "...");
}

function Amber_eating_out(){
	exelan("msg_Amber_eating_out");
}

function amber_more_jog(){
	var minutes = 40;
	var cost = -minutes/2,
	fraction =  (Player.total_content/Player.total_capacity);
	energy_charge =fraction*cost + cost;
	if (change_energy(Player, energy_charge, false) == -1){
		ctb_list(noone, noone, 
			strlan(EN, "You're too tired!", RUS, "Вы слишком устали!")
		);
		return;
	}
	change_mood(Player, -energy_charge, true);
	
	
	global.player_increase_endurance =  -energy_charge/1000;
	global.player_jog_minutes = minutes;
	
	Amber.likability += 5;
	character_finish_visit(Amber);
	global.scene_script = amber_jog;
	time_forward_minutes(15);
	scene_start_from(rmPark);
	global.last_dest = rmPark;
}

function amber_jog(){
	//time_forward_minutes(60);
	//ControlEnv.hours = 7;
	//ControlEnv.minutes = 50;
	Amber.likability += 5;
	global.scene_name = "Park";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	scene_add_actors(Amber, noone, noone);
	background_set(sprPark);
	Amber.jogged_today = true;
	
	if (Player.total_content/Player.total_capacity <= 0.5){
		ctb_list(player_jog_finish, noone, 
			strlan(EN, "You joined Amber on her jogging route through the Park.", 
			//UNTRANSLATED
						RUS,  "Вы с Эмбер вместе отлично побегали трусцой.",
						CN, "你和Amber如往常一样在一起慢跑。",
						JP, "あなたとアンバーは一緒に日課のジョギングを楽しみました。"
					),
			"You wonder what Amber would do if you went jogging with her while you were bloated."
		);	
	}else{
		//player_jog_finish
		ctb_list(
			Amber_jog_bloated_options, noone,
			"[speaker:noone] Scene render needs to be added :(",
			"[speaker:noone]You find Amber sitting on the bench in the center of the Park.",
			"When you approach, Amber turns and acknowledges you with a smile, but her expression quickly switches to one of shock.",
			"You grin, pushing your belly out a little bit to make it look bigger.",
			"Amber suddenly shifts from shocked to confident, walking over to you.",
			"[speaker:Amber]Is this your idea of a prank?",
			"She gives you a sly grin.",
			"I hate to break it to you, but you can’t fool me. That belly is obviously fake.",
			"[speaker:Player]Oh yeah?",
			"[speaker:Amber]Yeah! It’s just a big balloon painted to look natural! See?",
			"[speaker:noone]Amber places a hand on your distended stomach. You watch as the realization that your belly is real causes her jaw to drop and her eyes to widen.",
			"[speaker:Player]Something wrong?",
			"[speaker:noone]Filled with confidence, you put your hands on your hips and give her a knowing grin.",
			"[speaker:Amber]Uhhh...nope! Haha...",
			"[speaker:noone]Amber tries to play it cool, but you can tell that your belly is capturing her attention now that she knows it’s 100% natural.",
			"[speaker:noone]Well, time for our jog! You ready?",
			"[speaker:Amber]*gulp* Yeah, no sweat...",
			"[speaker:noone]The two of you begin your jog, Amber doing her best to avert her eyes from you out of nervousness.",
			"Your large, swollen belly makes keeping up with Amber difficult at first.",
			"Amber does slow down to match your pace, however.",
			"As you jog, you notice that Amber can’t help but look at your belly as it bounces and wobbles.",
			"[speaker:Amber]So, " + Player.name + ", not for nothing, but is there a reason you’re so huge?",
			"[speaker:Player]What, you mean my belly?",
			"[speaker:Amber]Yeah, that. Not many people jog when they have a gut like that. What gives?",
			"[speaker:noone]You consider your next words very carefully.",
			"This is your chance.",
			"What you say is likely going to influence Amber’s desires, so you ponder what exactly you should do."
		)
	}

}

function Amber_jog_bloated_options(){
	ds_list_clear(global.scene_actors);
	global.show_follower = true;
	create_character_holder(Amber.id);
	
	//TODO: switch scene to stopped (idle Amber + back facking Player)
	dialogue_init();
	dialogue_create(
		        "1",
				"Jogging while inflated makes my workout better.",
		        true,
		        function(){
					Amber.desire_inflate += 5;
					ctb_list(player_jog_finish_amber, noone,
						"[speaker:Player]Well, I blew myself up like a balloon to enhance my workout.",
						"It’s like...resistance training!",
						"You know, where you put weights on your body while you run?",
						"[speaker:Amber][ex:talk]Okay...",
						"I guess that makes sense.",
						"Won’t know for sure until I try it myself.",
						"[ex:idle][speaker:Player]With weights?",
						"[speaker:Amber]Yes! With weights! I don’t want to try and jog around here looking like I’m pregnant![ex:blush]",
						"[ex:idle][speaker:noone]Your plan worked! Amber seems more interested in inflation. Good job!"
					)
				}
		)
		
		dialogue_create(
		        "2",
				"Jogging while stuffed makes my workout better.",
		        true,
		       function(){
				   Amber.desire_stuffing += 5;
					ctb_list(player_jog_finish_amber, noone,
						"[speaker:Player]Well, I stuffed myself in order to enhance my workout.",
						"It’s like...resistance training!",
						"You know, where you put weights on your body while you run?",
						"[speaker:Amber]Okay...",
						"I guess that makes sense.",
						"Won’t know for sure until I try it myself.",
						"[speaker:Player]With weights?",
						"[speaker:Amber]Yes! With weights! ! I don’t want to try and jog around here looking like just cleaned out a buffet![ex:blush]",
						"[ex:idle][speaker:noone]Your plan worked! Amber seems more interested in stuffing. Good job!"
					)
				}
		)
		
	dialogue_start(false);
}

function player_jog_finish_amber(){
	ctb_list(player_jog_finish, noone,
		"[speaker:noone]Eventually, your jogging session comes to an end.",
		"[speaker:Amber]Well, I should probably get going.",
		"[speaker:Player]Okay. See you later! Maybe we can do some resistance training together next time!",
		"[speaker:noone]Amber acknowledges what you said, her eyes darting to your belly before she waves goodbye and departs."
	)
}

function Amber_drink_kitchensink(){
	global.scene_name = "Drink";
	global.scene_inflate_rate = 2;
	global.allow_stream = true;
	scene_add_actors(Amber, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
}

/*function amber_jog(){
	//time_forward_minutes(60);
	//ControlEnv.hours = 7;
	//ControlEnv.minutes = 50;
	Amber.likability += 5;
	global.scene_name = "Park";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	scene_add_actors(Amber, noone, noone);
	background_set(sprPark);
	Amber.jogged_today = true;
	//global.player_jog_minutes = 60;
	if (!Amber.met_player){
		Amber.met_player = true;
		Amber.has_number = true;
		exelan("msg_Amber_jog");
	}else{
		ctb_list(player_jog_finish, noone, 
			strlan(EN, "You joined Amber on her jogging route through the Park.", 
			//UNTRANSLATED
						RUS,  "Вы с Эмбер вместе отлично побегали трусцой.",
						CN, "你和Amber如往常一样在一起慢跑。",
						JP, "あなたとアンバーは一緒に日課のジョギングを楽しみました。"
					)
		);	
	}

}*/