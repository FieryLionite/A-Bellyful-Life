function d_standard() {
	var char = global.dialogue_char;
	if (char.is_npc){
	    char.script_dialogue();
	    ctb_list(noone, noone, "...");
	    exit;
	}

	//var d = global.dialogues;
	dialogue_init()

	if (char.id != Player.id){
		 dialogue_create(
	            "1Request",
	            strlan(EN, "Request", RUS, "Запрос", JP, "リクエスト", CN, "要求"),
	            true,
	            //d_talk
				d_request
	    )	
		
		
	}

	if (char.id != Player.id)
	    dialogue_create(
	            "ZActions",
	            //strlan(EN, "Actions", RUS, "Действия", JP, "行動", CN, "行动"),
				strlan(EN, "Talk", RUS, "Разговаривать", JP, "話", CN, "讲话"),
	            true,
	            //d_talk
				function(){global.dialogue_char.script_dialogue();}
	    )
	    else
	    dialogue_create(
	            "1Talk",
	            strlan(EN, "Talk", RUS, "Разговаривать", JP, "トーク", CN, "讲话"),
	            false,
	            "You can't talk to yourself!"
	    )
		
	if (char.id == Player.id){
		if (Player.bowels_air >= 200)
			dialogue_create(
		            "Fart",
		            strlan(EN, "Fart"),
		            true,
		            //d_talk
					function(){with (Player) do_fart();}
		    )
			
		if (Player.stomach_air >= 200)
			dialogue_create(
		            "Burp",
		            strlan(EN, "Burp"),
		            true,
		            //d_talk
					function(){with (Player) do_burp();}
		    )
	}

	dialogue_create(
	        "2Status",
	        strlan(EN, "Status", RUS, "Состояние", JP, "状態", CN, "健康）状况"),
	        true,
	        d_status
	)
	
	if (char.using_mpump){
		dialogue_create(
		    "pump",
		    strlan(EN,"Detach mini pump", RUS, "Отсоедините мини-насос.", JP, "ミニポンプを外す", CN, "拆下迷你泵"),
		    true,
		    detach_mpump
		)
	}
	
	if (char.using_vibrator){
		dialogue_create(
		    "pump",
		    strlan(EN,"Detach vibrator"),
		    true,
		    detach_vibrator
		)
	}
	
	if (char.plugged){
		global.buttplug_target = char;
		dialogue_create(
		    "bp",
		    strlan(EN,"Detach butt plug"),
		    true,
		    function(){ detach_buttplug(global.buttplug_target);}
		)
	}
	
	//if (char.visiting){
	if (in_house()){
		if (char.following)
		dialogue_create(
		        "4",
		        strlan(EN, "Ask them to leave", RUS, "Попроси ее уйти", JP, "彼女に去るように頼む", CN, "要求她离开"),
		        true,
		        function(){
					var char = global.dialogue_char;
					ctb_list(
						function(){
							character_finish_visit(global.dialogue_char);
							refresh_location();
						}
						, noone, cmd_speaker(Player)+choose(
						"I'm sorry but something came up, could you return for today?",
						"Sorry but I had an unexpected errand that will take a while. Do you want to hang out on another day?",
						"I apologize but it seems I have to go"
					), cmd_speaker(char.object_index)+"Sure, no problem. Let's hang out next time!")
				}
			)
			
		if (char.object_index != Player){
			if (!char.following)
				dialogue_create(
			        "3",
			        strlan(EN, "Come with me for a bit", RUS, "Пойдем со мной ненадолго", JP, "ちょっと一緒に来て", CN, "跟我来一会儿"),
			        true,
			        function(){
						with (Character) following = false;
						ctb_list(noone, noone, make_expression_cmd(ex_talk) +"Ok", make_expression_cmd(ex_idle) + "...");
						global.dialogue_char.following = true;
					}
				)
			else
				dialogue_create(
			        "3",
			        strlan(EN, "Lets get back to what we were doing.", RUS, "Вернемся к тому, что мы делали", JP, "やっていたことに戻りましょう", CN, "让我们回到我们正在做的事情上"),
			        true,
			        function(){
						var char = global.dialogue_char;
						ctb_list(noone, noone,make_expression_cmd(ex_talk) + "Ok", make_expression_cmd(ex_idle) + "...");
						global.dialogue_char.following = false;
						refresh_location();
						global.dialogue_char = char;	
					}
				)
		}
	}

	/*dialogue_create(
	        "3Observe",
	        "Observe",
	        true,
	        d_observe
	)*/

	dialogue_start(true);

}

/*function d_follow(){
	with (Character) following = false;
	
	ctb_list(noone, noone, make_expression_cmd(ex_talk) +"Ok", make_expression_cmd(ex_idle) + "...");
	global.dialogue_char.following = true;
}*/

/*function d_unfollow(){
	var char = global.dialogue_char;
	ctb_list(noone, noone,make_expression_cmd(ex_talk) + "Ok", make_expression_cmd(ex_idle) + "...");
	global.dialogue_char.following = false;
	refresh_location();
	global.dialogue_char = char;
}*/

/*function d_ask_leave(){
	var char = global.dialogue_char;
	ctb_list(action_leave, noone, cmd_speaker(Player)+choose(
		"I'm sorry but something came up, could you return for today?",
		"Sorry but I had an unexpected errand that will take a while. Do you want to hang out on another day?",
		"I apologize but it seems I have to go"
	), cmd_speaker(char.object_index)+"Sure, no problem. Let's hang out next time!")
	
}*/

/*function action_leave(){
	character_finish_visit(global.dialogue_char);
	refresh_location();
}*/