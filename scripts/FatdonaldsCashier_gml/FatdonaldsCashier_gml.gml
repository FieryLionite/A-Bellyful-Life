function fatdonalds_location(){
	return rmFatdonalds;
}

function fatdonalds_dialogue(){
	
	dialogue_init();
	

	if (!FatdonaldsCashier.player_registered){
		dialogue_create(
		        "1",
		       msg_ask_ptj(),
		        true,
		       d_fatdonalds_ptj
		)
	}else{
		dialogue_create(
		        "1",
		        msg_quit_ptj(),
		        true,
		       d_fatdonalds_quit
		)
	}
	
	dialogue_create(
		        "2",
		        exelan("msg_make_purchase"),
		        true,
		       d_fatdonalds_shop
		)

	dialogue_start(true);
}

function d_fatdonalds_shop(){
		global.shop_bg = background_get();
		global.shop_items = list_create(IHamburger, IFries, IHotdog, ISoda, IEspresso, ISundea, IHugeburger);	
		global.last_room = room;
		custom_goto(rmShop);
}

function d_fatdonalds_quit(){
	FatdonaldsCashier.last_cancelled = 3;
	FatdonaldsCashier.player_registered = false;
	
	ctb_list(noone, noone, msg_fired("Fatdonalds"));
}

function d_fatdonalds_ptj(){
	if (FatdonaldsCashier.last_cancelled > 0){
		ctb_list(noone, noone, msg_just_quit());
		return;
	}
	
	
	dialogue_init();

	dialogue_create(
	        "1",
	        msg_accept(),
	        true,
	       d_fatdonalds_accept
	)
	
	dialogue_create(
	        "2",
	        msg_think_about_it(),
	        false,
	       msg_alright()
	)

	dialogue_start(false);
	ctb_list(noone, noone, strlan(
		EN, "You took some time to contemplate the job:#The pay is low, but you don't need to do much.","(Per hour) pay: $11, energy use: 8, mood: very  boring",
		CN, "你考虑了下这份工作:#薪水很低，但是消耗额能量很少。","(每小时) 薪水：$11, 消耗能量: 8, 心情： 非常无聊",
		JP, "あなたは仕事について考えこみました。：※ 給料は低いですが、あまり多くのことを求められません。","(1時間あたり)給料：$11, 体力消費：8,気分：やや退屈",
		RUS, "Вам потребовалось время, чтобы понять в чем заключается работа:#Заработок невысокий, но много делать не нужно.","(В час) платят: $11, тратит энергии: 8, настроение: очень скучно"
	)
	);
}

function d_fatdonalds_accept(){
	FatdonaldsCashier.player_registered = true;
	
	dialogue_init();

	dialogue_create(
	        "1",
	        "7-12am",
	        true,
	       d_fatdonalds_1stshift
	)
	
	dialogue_create(
	        "2",
	        "12am-5pm",
	        true,
	       d_fatdonalds_2ndshift
	)
	
	dialogue_create(
	        "3",
	        "5pm-10pm",
	        true,
	       d_fatdonalds_3rdshift
	)

	dialogue_start(false);
	ctb_list(noone, noone,msg_ptj_welcome());
}

function d_fatdonalds_1stshift(){
	FatdonaldsCashier.player_shift = 1;
}
function d_fatdonalds_2ndshift(){
	FatdonaldsCashier.player_shift = 2;
}
function d_fatdonalds_3rdshift(){
	FatdonaldsCashier.player_shift = 3;
}