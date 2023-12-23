function fataurant_location(){
	return rmFataurant;
}

function fataurant_dialogue(){
	
	dialogue_init();
	

	if (!FataurantCashier.player_registered){
		dialogue_create(
		        "1",
		       msg_ask_ptj(),
		        true,
		       d_fataurant_ptj
		)
	}else{
		dialogue_create(
		        "1",
		        msg_quit_ptj(),
		        true,
		       d_fataurant_quit
		)
	}
	dialogue_create(
		        "2",
		        exelan("msg_make_purchase"),
		        true,
		       d_fataurant_shop
		)

	dialogue_start(true);
}

function d_fataurant_shop(){
		global.shop_bg = background_get();
		global.shop_items = list_create(ISundea, ISoda);	
		global.last_room = room;
		custom_goto(rmShop);
}

function d_fataurant_quit(){
	FataurantCashier.last_cancelled = 3;
	FataurantCashier.player_registered = false;
	
	ctb_list(noone, noone, msg_fired("Fataurant"));
}

function d_fataurant_ptj(){
	if (FataurantCashier.last_cancelled > 0){
		ctb_list(noone, noone, msg_just_quit());
		return;
	}
	
	
	dialogue_init();

	dialogue_create(
	        "1",
	       msg_accept(),
	        true,
	       d_fataurant_accept
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
		CN, "你考虑了下这份工作:#薪水很高，但是服务顾客会消耗你所有的能量！。","(每小时) 薪水：$20, 消耗能量: 18, 心情： 疲劳的",
		JP, "あなたは仕事について考えこみました。：※ 給料は高いですが、接客にすべての体力を使う必要があります！","(1時間あたり) 給料：$20, 体力消費：18, 気分：疲労",
		RUS, "Вам потребовалось время, чтобы понять в чем заключается работа:#Зарплата тут большая, но тебе придется потратить всю свою энергию на обслуживание клиентов!.","(В час) платят: $20, тратит энергии: 18, настроение: утомительно"
		)
	);
}

function d_fataurant_accept(){
	FataurantCashier.player_registered = true;
	
	dialogue_init();

	dialogue_create(
	        "1",
	        "7-12am",
	        true,
	       d_fataurant_1stshift
	)
	
	dialogue_create(
	        "2",
	        "12am-5pm",
	        true,
	       d_fataurant_2ndshift
	)
	
	dialogue_create(
	        "3",
	        "5pm-10pm",
	        true,
	       d_fataurant_3rdshift
	)

	dialogue_start(false);
	ctb_list(noone, noone, msg_ptj_welcome());
}

function d_fataurant_1stshift(){
	FataurantCashier.player_shift = 1;
}
function d_fataurant_2ndshift(){
	FataurantCashier.player_shift = 2;
}
function d_fataurant_3rdshift(){
	FataurantCashier.player_shift = 3;
}