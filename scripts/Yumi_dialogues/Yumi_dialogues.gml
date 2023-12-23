function Yumi_dialogues(){
	dialogue_init();
	var show_belly_msg = strlan(
			EN, "Show her your belly",
			RUS, "Показать ей свой живот",
			CN, "给她看你的肚子",
			JP, "お腹を見せる"
	);
	
	dialogue_create(
		        "shrink",
		        strlan(
					EN, "Ask about shrink pills",
					RUS, "Спросите о термоусадочных таблетках",
					CN, "询问缩水丸",
					JP, "シュリンクピルについて質問する"
				),
		        true,
		        function(){
					if(Yumi.likability < 30){
						ctb_msg("I'm sorry but I don't know what you are asking for (she feign ignorance)");
					}else{
						ctb_msg("How did you hear about that experimental pill?");
						//TODO: cont
					}
				}
		)
	
	
	if (!Yumi.interested){
		dialogue_create(
		        "e",
		        strlan(
					EN, "General Examination (-$50)",
					RUS, "Обычный осмотр (-$50)",
					CN, "身体检查(-$50)",
					JP, "診察（-$50）"
				),
		        true,
		        Yumi_exam
		)
	}else if (!Yumi.gave_exam_today){
		dialogue_create(
		        "e",
				show_belly_msg,
		        true,
		        Yumi_exam2
		)
	}else{
		dialogue_create(
		        "e",
		        show_belly_msg,
		        false,
				strlan(
					EN, "Didn't you already got your exam today? Come back tomorrow.",
					RUS, "Разве тебя сегодня не осматривали? Приходи завтра.",
					CN, "你今天不是做过检查了?明天再来.",
					JP, "今日はもう診察したから、明日また来てね。"
				)
		)
	}
	
	eating_out_ask(Yumi);
	
	dialogue_start(true);
	
	ctb_list(noone, noone, strlan(
		EN, "Welcome to my clinic, are you here for a check up?",
		RUS, "Добро пожаловать в мою клинику, ты здесь чтобы провериться?",
		CN, "欢迎来到我的诊所，你是来做检查的么?",
		JP, "いらっしゃい、ここには診察にきたのかな？"
		)
	);
}

function Yumi_eating_out(){
	
	ctb_msg(
		cmd_speaker(Yumi) + cmd_ex(ex_smile) +cmd_sound(get_random_asset("chewsoft", 1,4))  + "...",
		cmd_ex(ex_talk) + cmd_speaker(noone) + cmd_sound(get_random_asset("chewsoft", 1,4))  +
		"Yumi's eating posture was very refined and graceful, as if she is an aristocratic lady from one of the visual novels you recently played.",
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "Still, despite such graceful gestures and calm demeanor, Yumi never stiopped taking in more food",
		cmd_sound(get_random_asset("chewsoft", 1,4)) +"You wonder if her stomach would billow out at any moment.",
		cmd_speaker(Yumi) +  cmd_ex(ex_smile2) + "Are you wondering why I'm eating so much?",
		cmd_ex(ex_idle) + cmd_speaker(noone) + "You nodded",
		cmd_speaker(Yumi) +  cmd_ex(ex_smile) + "Me too. I'm actually trying to put myself in your shoes. How would it feel to have your stomach stretched out like that. (She pats her slightly bulging belly). I don't think its so bad at all. This feeling is quite strange yet comfortable. I'm going to have to eat with you more often it seems.",
		cmd_ex(ex_idle) + "..."
	);
}

function Yumi_exam(){
	if (ControlEnv.money < 50){
		ctb_list(noone, noone, 
			strlan(EN, "I'm terribly sorry, but the clinic will go bankrupt if I give free examinations.",
						RUS, "Мне очень жаль, но клиника обанкротится, если я проведу бесплатные обследования.",
						CN, "抱歉，如果我给每个人都做免费检查的话，我的诊所就要破产了。",
						JP, "大変申し訳無いのですが、無料での診察はいたしかねております。"
					)
			);
		return;
	}
	Yumi.gave_exam_today = true;
	if (Player.total_content/Player.total_capacity >= 0.5){
		exelan("msg_Yumi_exam");
		Yumi.interested = true;
		Yumi.has_number = true;
		ControlEnv.money += 25;
		Yumi.desire_inflate += 10;
		Yumi.desire_stuffing += 10;
		Yumi.likability += 5;
	}else{
		exelan("msg_Yumi_exam2_empty");
		ControlEnv.money -= 50;
	}
}

function Yumi_exam2(){
	Yumi.gave_exam_today = true;
	ControlEnv.money += 25;
	var ratio = Player.total_content/(clamp(Player.total_capacity, 3000, 6500));
	if (ratio >= 0.8){
		Yumi.likability += 9;
		ControlEnv.money += 10;
		Yumi.desire_inflate += 9;
		Yumi.desire_stuffing += 9;
		exelan("msg_Yumi_exam2_full");
	}else if (ratio >= 0.5){
		Yumi.likability += 5;
		Yumi.desire_inflate += 5;
		Yumi.desire_stuffing += 5;
		exelan("msg_Yumi_exam2_half");
	}else{
		exelan("msg_Yumi_exam2_empty");
	}
}