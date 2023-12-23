function msg_make_purchase_EN(){
	return  "Make a purchase";
}
function msg_make_purchase_CN(){
	return  "进行购买";
}
function msg_make_purchase_JP(){
	return  "買物をします";
}
function msg_make_purchase_RUS(){
	return  "Совершить покупку";
}
///////////////

function msg_fired(storename){
	return strlan(
		EN, "You're no longer a "+storename+" employee.",
		CN, "你不再是 "+storename+" 的雇员",
		JP, "なたはもう "+storename+" の従業員ではない。",
		RUS, "Ты больше не сотрудник в "+storename
	);
}

//////

function msg_just_quit(){
	return strlan(
		EN, "You've just quit today! At least wait until tomorrow to reapply?",
		CN, "你今天刚刚离职！等到明天再重新申请。",
		JP, "今日辞めたばかりじゃないか！せめて明日まで待って再応募してくれませんか？",
		RUS, "На сегодня ты закончила! Подожди до завтра, чтобы продолжить"
	);
}

/////
function msg_ptj_welcome(){
	return strlan(
		EN, "Welcome abroad! Which shift do you want to take?",
		CN, "欢迎！你想要做什么工作？",
		JP, "応募ありがとう！　働く時間帯はどれにしますか？",
		RUS, "Добро пожаловать! В какую смену вы хотите работать?"
	)
}

////

function msg_accept(){
	return strlan(
		EN, "Accept!",
		CN, "接受！",
		JP, "受け入れます！",
		RUS, "Принимать!"
	);
}

function msg_think_about_it(){
	return strlan(
		EN,  "I'll think about it",
		CN, "我会考虑一下",
		JP, "考えてみます",
		RUS, "я подумаю об этом"
	);
}

function msg_alright(){
	return strlan(
		EN, "Alright.",
		CN, "好的。",
		JP, "よし。",
		RUS, "Хорошо."
	);
}

//////

function msg_ask_ptj(){
		return strlan(
			EN,  "Ask for part time job",
			CN, "要求兼职工作",
			JP, "アルバイトを頼む",
			RUS, "Попросите подработку"
		);
}

function msg_quit_ptj(){
		return strlan(
			EN,  "Ask for part time job",
			CN, "辞去兼职工作",
			JP, "アルバイトをやめる",
			RUS, "Бросить работу с частичной занятостью"
		);
}