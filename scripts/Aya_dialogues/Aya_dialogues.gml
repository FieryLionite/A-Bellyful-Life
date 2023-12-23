function aya_dialogue(){
	dialogue_init()
	
	if (in_house())
	dialogue_create(
	        "1",
	        "Let's study some more! (1hr)",
	        true,
			aya_more_study
	)
	
	eating_out_ask(Aya);
	
	dialogue_start(true);
	
	ctb_list(noone, noone, "...");
}

function Aya_eating_out_BU(){
	ctb_msg(
		cmd_speaker(Aya) + cmd_ex(ex_talk) +cmd_sound(get_random_asset("chewsoft", 1,4))
			+ "...",
		+ cmd_ex(ex_smile)+cmd_sound(get_random_asset("chewsoft", 1,4)) + "...",
		cmd_speaker(noone) + "You noticed that  Aya is reading her book even while eating but didnt bother to say anything",
		"It seems that Aya was so absorbed in her reading that she didnt notice how much food she was taking in",
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "Curiously, you wondered how many hamburgers can she fit insider her small figure and took care to replace any of the food that was eaten.",
		cmd_sound(get_random_asset("drink", 1,4)) + "Alas, Aya finally snapped out of her eating daze. But by then there was a noticeable bulge on her tummy.",
		cmd_speaker(Aya) + cmd_ex(ex_idle)+ "..."
		);
}

function Aya_eating_out(){
	ctb_msg(
		"[speaker:noone] You watch as Aya, always keen on studying, eats her food whilst reading a book.",
		"As you munch on your own food, you notice that she is completely lost in whatever she’s reading, and that she is eating much more than she normally would.",
		"Curious to see when she’ll notice that she’s accidentally stuffing herself, you quietly go back to the cashier and order more food.",
		"Aya doesn’t even realize that you’ve left. You return with the goods and slyly put more food in front of her. ",
		"To your surprise, your plan works. Aya packs several more slices of cake into her belly over the course of the next few minutes. You find that you can’t look away.",
		"Aya does eventually snap out of her reading trance, but by the time she does, her stomach is noticeably bloated, her clothes pulled tight across her midsection.",
		"[speaker:Aya]*burp* Oof...I feel so full. Just how much did I eat while I was reading?",
		"Gosh...I really need to pay attention to my waistline...",
		"[speaker:noone]She seems defeated. You decide to cheer her up.",
		"[speaker:Player]Don’t sweat it, Aya. You’re not the only one who chowed down today. Just look at me!",
		"[speaker:noone]You show off your own bloated stomach, which makes Aya scratch the back of her head nervously.",
		"[speaker:Aya]I guess neither of us knows the meaning of restraint when it comes to this place’s cake.",
		"[speaker:noone]The two of you share a laugh before leaving the café.",
		"As you both go your separate ways, you wonder just how big Aya can get. The thought of finding out excites you."
	)
}

function aya_more_study(){
	time_forward_minutes(45);
	if (Player.mood <= 10){
		ctb_list(noone, noone, "You're too bored to suggest that!");
	}else{
		Aya.likability += 5;
		splash_message("Likability +5", c_lime);
		time_forward_minutes(59);
		
		global.scene_script = aya_study;
		scene_start_from(rmLivingroom);
	}
}

/*function checkAyaEvent(){
	return (ControlEnv.hours == 7 && ControlEnv.minutes <= 35 && room == rmPool);
}*/

function aya_study_first(){

	ctb_list(function(){
		global.scene_script = aya_study;
		scene_start();
	}, noone, 
		"[s:Aya]Good to see you, $PlayerName. Are you going to show me around?",
		 "[s:noone]You gave her a tour of the new place, showing her each of the rooms. ",
		 "You start to imagine just how much fun you can have with Aya here.",
		 "[set_background:sprBathroom]As you pass through the bathroom, your eyes linger on the sink and shower head for a moment. ",
		 "In your head, you can see Aya with her mouth under the sink, filling her belly with water. You then see her unhooking the shower head before inserting it into her butt, causing her stomach to swell further.",
		 "You can’t help but bite your lip, the idea turning you on.",
		 "[s:Aya]Is something wrong, $PlayerName?",
		 "[s:noone]You shake your head.",
		 "[s:Player] No, not at all! Hahaha...",
		 "[set_background:sprKitchen][s:noone]You try your best to laugh it off as you move into the kitchen.",
		 "But seeing the fridge gives you another idea. You begin to imagine Aya being stuffed to the brim with burgers and fries, her stomach so bloated that her clothes can’t contain it.",
		 "You shake your head, but the idea is still there, enticing you.",
		 "[set_background:sprAyaStudyBG][s:Aya]This is an amazing pad. It’s quiet, too. A perfect place to study, wouldn’t you say?",
		 "[s:Player]Hm? Oh, yeah, totally!",
		 "[s:Aya]Well, I’m glad you think so, because I actually brought my study materials with me.",
		 "[s:Player]Aw, man. You tricked me!",
		 "[s:noone]Aya, despite normally being so softspoken and shy, actually has a confident smile on her face.",
		 "[s:Aya]Our summer of studying begins today!",
		 "[s:Player]Dang it!",
		 "I didn’t agree to this!"
	)
}

function aya_study(){
	global.scene_name = "Study";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	Aya.likability += 5;
	splash_message("Likability +5", c_lime);
	time_forward_minutes(59);
	change_mood(Player, -45, true);
	scene_add_actors(Aya, noone, noone);
	background_set(sprAyaStudyBG);
	ctb_list(//FIX lol
		function(){
			if (Player.total_content/Player.total_capacity >= 0.7){
				ctb_list(aya_choice, noone , 
				"[speaker:Aya](She noticed your inflated belly.)",
				"Why is your stomach so huge? Did you have three buffets this morning?",
				"[speaker:Player](You contemplated on what to say.)");
			}
		}
		, noone,
		 "[s:noone]Before long, Aya has her laptop and books laid out on table in your living room.",
		 "You begrudgingly bring your own studying stuff, mainly novels assigned to you by your future professors.",
		 "For an hour and a half, you pore through the books, trying your best to stay awake. It’s painful, but you make it through.",
		 "Seemingly satisfied with the study session, Aya hums to herself as she packs her things.",
		 "[s:Aya]We should do this again sometime.",
		 "[s:Player]We can also just hang out, you know. As much as I love studying, I like hanging out with you more.",
		 "[s:Aya]We do need to study, though.",
		 "[s:Player]I’d say hanging out with my bestie is just as important!",
		 "[s:noone]You give her a side hug and ruffle her hair a little bit.",
		 "[s:Player]Don’t be a stranger, okay?",
		  "[s:Aya][ex:blush]Okay (She blushes)",
		  "[ex:idle]"
		// "[s:Aya]Okay. See you later.",
		// "[s:noone]With that, she exits through the front door and disappears."
		);
	
	/*var msgStudy = "You and Aria studied together for the next hour. It was quite boring, but you made it through.";
	if (Player.total_content/Player.total_capacity >= 0.7){
		ctb_list(aya_choice, noone , 
		"[speaker:Aya](She noticed your inflated belly.)",
		"Why is your stomach so huge? Did you have three buffets this morning?",
		"[speaker:Player](You contemplated on what to say.)");
	}else{
		ctb_list(noone, noone , msgStudy);
	}*/
}

function Aya_drink_kitchensink(){
	global.allow_stream = true;
	global.scene_name = "Drink";
	global.scene_inflate_rate = 2;
	scene_add_actors(Aya, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
	//ctb_list(noone, noone , "stufffff");
}

function aya_choice(){
	dialogue_init()
	dialogue_create(
	        "1",
	        "Being inflated helps my focus.",
	        true,
	        aya_choice_inflate
	)
	dialogue_create(
	        "2",
	        "Being stuffed with food helps my focus",
	        true,
	        aya_choice_stuffing
	)
	
	dialogue_start(false);
}

function aya_choice_inflate(){
	Aya.desire_inflate += 5;
	splash_message("inflate desire +10",c_lime);
	ctb_list(noone, noone, "[set_speaker:Aya]I see. (She seems much more interested in inflation)")
}

function aya_choice_stuffing(){
	Aya.desire_stuffing += 5;
	splash_message("stuffing desire +10",c_lime);
	ctb_list(noone, noone, "[set_speaker:Aya]I see. (She seems much more interested in stuffing)")
}