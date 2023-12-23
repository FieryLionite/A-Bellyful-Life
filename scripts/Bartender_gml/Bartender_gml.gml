function bartender_location(){
	return rmBar;
}

function bartender_dialogue(){
	
	dialogue_init();
	
/*
	if (!Bartender.player_registered){
		dialogue_create(
		        "1",
		        "Ask for part time job",
		        true,
		       d_bartender_ptj
		)
	}else{
		dialogue_create(
		        "1",
		        "Quit part time job",
		        true,
		       d_bartender_quit
		)
	}*/
	
	dialogue_create(
		        "2",
		       exelan("msg_make_purchase"),
		        true,
		       d_bartender_shop
		)

	dialogue_start(true);
}

function d_bartender_shop(){
		global.shop_bg = background_get();
		global.shop_items = list_create(ICocktail1, ICocktail2, ICocktail3, ICocktail4);	
		global.last_room = room;
		custom_goto(rmShop);
}

function d_bartender_quit(){
	Bartender.last_cancelled = 1;
	Bartender.player_registered = false;
	
	ctb_list(noone, noone, msg_fired("Bar"));
}

function d_bartender_ptj(){
	if (Bartender.last_cancelled > 0){
		ctb_list(noone, noone, msg_just_quit());
		return;
	}
	
	
	dialogue_init();

	dialogue_create(
	        "1",
	        msg_accept(),
	        true,
	       d_bartender_accept
	)
	
	dialogue_create(
	        "2",
	        msg_think_about_it(),
	        false,
	       msg_alright()
	)

	dialogue_start(false);
	ctb_list(noone, noone,
		strlan(
			EN, "You took some time to contemplate the job:#The pay is high, but you'll need to spend all your energy serving customers!.","(Per hour) pay: $20, energy use: 18, mood: exhausting",
			CN, "你考虑了下这份工作:#薪水还可以，但是因为顾客的要求很多且细致，会消耗你很多能量。","(每小时) 薪水：$16, 消耗能量: 14, 心情： 有点无聊",
			JP, "あなたは仕事について考えこみました。：※ 給料はまあまあだけど、接客の細かい注文に対応するのにもっとエネルギーを使わないといけない","(1時間あたり)給料：$16, 体力消費：14,気分：やや退屈",
			RUS, "Вам потребовалось время, чтобы понять в чем заключается работа:#С оплатой все в порядке, но тебе нужно будет потратить больше энергии на подробные заказы клиентов.","(В час) платят: $16, тратит энергии: 14, настроение: несколько скучно"
		)	
	);
}

function d_bartender_accept(){
	Bartender.player_registered = true;
	
	dialogue_init();

	dialogue_create(
	        "1",
	        "7-12am",
	        true,
	       d_bartender_1stshift
	)
	
	dialogue_create(
	        "2",
	        "12am-5pm",
	        true,
	       d_bartender_2ndshift
	)
	
	dialogue_create(
	        "3",
	        "5pm-10pm",
	        true,
	       d_bartender_3rdshift
	)

	dialogue_start(false);
	ctb_list(noone, noone,msg_ptj_welcome());
}

function d_bartender_1stshift(){
	Bartender.player_shift = 1;
}
function d_bartender_2ndshift(){
	Bartender.player_shift = 2;
}
function d_bartender_3rdshift(){
	Bartender.player_shift = 3;
}