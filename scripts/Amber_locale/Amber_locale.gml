function msg_Amber_eating_out_EN(){
	ctb_msg(
		"[speaker:noone]To your eternal surprise, Amber not only orders a sizeable amount of food, but devours it as if she had been starved for days.",
		"In the span of a few minutes, she devastates multiple hamburgers and a few large orders of fries.",
		"You’re compelled to comment on the situation, which has you very much aroused.",
		"[speaker:Player]Dang, girl, you can really eat when you want to! Where does all that food go?",
		"[speaker:Amber]People call me the bottomless pit for a reason, haha!",
		"[speaker:noone]She gives you a grin as she chomps on a few fries.",
		"[speaker:Amber]Plus, if somebody else is buying, I don’t tend to hold back.",
		"[speaker:Player]No kidding!",
		"[speaker:noone]The two of you engage in some small talk as you continue to eat.",
		"You find yourself staring at Amber’s slowly filling stomach as time passes, and you subconsciously eat just as much as her, your own belly becoming bloated and full.",
		"When you finally finish, the two of you are thoroughly stuffed.",
		"[speaker:Amber]Whew! I feel like I’m going to pop! Good thing I wore my stretchy shorts today.",
		"[speaker:Player]Dang...if I keep eating out with you, I might have to invest in some sweatpants. ",
		"[speaker:Amber]That’s what you get for trying to eat as much as me, haha!",
		"[speaker:noone]The two of you eventually exit the fast-food restaurant, your bellies swollen and laden with way too many hamburgers.",
		"Chuckling at just how stuffed you both are, you go your separate ways, waving goodbye to each other as you walk to your respective neighborhoods."
		
	);
}
/////////////////

function msg_Amber_jog_EN(){
	ctb_list(player_jog_finish, noone, "After a round of jogging, both of you stopped to take a small break",
			"[speaker:Amber]Good morning! I'm Amber. It's nice to have someone to jog with.",
			"[speaker:Player]Yup! I'm " +Player.name+", nice to meet you. Do you jog here often?",
			"[speaker:Amber]Every morning from 6 to 8.");
}

function msg_Amber_jog_RUS(){
	ctb_list(player_jog_finish, noone,"После пробежки вы оба остановились, чтобы сделать небольшой перерыв.",
		"[speaker:Amber]Доброе утро! Я Эмбер. Приятно иметь бегать трусцой с кем-то вместе.",
		"[speaker:Player]Ага! Я " +Player.name+", приятно познакомиться. И часто ты здесь бегаешь?",
		"[speaker:Amber]Каждое утро с 6 до 8.");
}

function msg_Amber_jog_CN(){
	ctb_list(player_jog_finish, noone,"小跑了一会，你们都停下来休息了一会",
		"[speaker:Amber]早上好！我是Amber，有个人陪我一起跑真不错.",
		"[speaker:Player]对呀！我是"+Player.name+",很高兴认识你。你经常在这里跑步么？",
		"[speaker:Amber]是的，我每天早上6点到8点都在。"
		);
}

function msg_Amber_jog_JP(){
	ctb_list(player_jog_finish, noone,"一通りジョギングをした後、二人は少し休憩をするために立ち止まりました。",
		"[speaker:Amber]おはよう！ わたしAmber。一緒にジョギングする人がいてうれしい！",
		"[speaker:Player]やっほー！私は " +Player.name+"、よろしくね。ここでよくジョギングするの？",
		"[speaker:Amber]うん！毎朝６時から８時までやってるの！"
		);
}