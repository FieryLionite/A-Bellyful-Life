function Bobbie_dialogues(){
	dialogue_init()
	
	if (in_house())
		dialogue_create(
		        "1",
		        strlan(
					EN, "Let's smoke more weed! (45m)",
					CN, "我们一起来接着哈草(45m)",
					RUS, "Давай покурим ещё травки! (45 мин)",
					JP, "もっと葉っぱを吸おう！（45分）"
				),
		        true,
		        Bobbie_smoke_together//"(Event not implemented)"
		)
	
	dialogue_create(
		        "2",
				strlan(
					EN, "Make a purchase",
					CN, "购买物品",
					RUS, "Сделать заказ",
					JP, "購入する"
				),
		        true,
		       bobbie_shop
		)

		
	eating_out_ask(Bobbie);
	dialogue_start(true);
	
	var shop_msg = strlan(
			EN, "Welcome to my secret shop! (she opened her backpack, revealing all the goods).",
			CN, "欢迎来到我的秘密商店！(她打开了她的背包，展示所有的物品).",
			RUS, "Добро пожаловать в мой секретный магазинчик! (она открыла рюкзак, показывая все товары).",
			JP, "私の秘密のお店へようこそ！（彼女はバックパックを開き、すべての商品を見せた）"
		);
	
	if (Bobbie.likability > 30){
		shop_msg += " Since we're buddies, I can show you some special goods!";
	}
	
	ctb_msg(cmd_speaker(Bobbie)+
		shop_msg
	);
}

function Bobbie_eating_out(){
	ctb_msg(
		cmd_speaker(Bobbie) + cmd_ex(ex_talk)  +cmd_sound(get_random_asset("chewsoft", 1,4)) + "...", 
		cmd_ex(ex_idle) +cmd_sound(get_random_asset("chewsoft", 1,4)) + "...",
		cmd_ex(ex_smile2) + cmd_sound(get_random_asset("chewsoft", 1,4)) + "Thank you so much for the free food, I'm definitely not going to waste any of it!",
		cmd_ex(ex_smile)+ cmd_sound(get_random_asset("chewsoft", 1,4)) + "(Bobbie said as she rapidly consume all the food)",
		cmd_ex(ex_idle) + cmd_speaker(noone) + "You can't help but think that Bobbie and Amber are alike in this aspect.",
		cmd_speaker(Bobbie) +cmd_ex(ex_blush) + cmd_speaker(noone) +"As you both finish, you can see Amber, ahem, Bobbie flopping back with her ball-like belly up like a stoned goldfish",
		cmd_speaker(Bobbie) + cmd_ex(ex_idle)+ "..."
	)
}

function Bobbie_drink_kitchensink(){
	global.scene_name = "Drink";
	global.allow_stream = true;
	global.scene_inflate_rate = 2;
	scene_add_actors(Bobbie, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
}

function bobbie_shop(){
		global.shop_bg = background_get();
		global.shop_items = list_create(IWeedBag, IWeedBagExotic, ISmokingPipe,ICigarettePack, IPillShrink, IPillSlime);
		if (Bobbie.likability > 30)
			ds_list_add(global.shop_items, IPillShrink);
		
		global.last_room = room;
		custom_goto(rmShop);
}

function Bobbie_smoke_together(){
	exelan("msg_Bobbie_smoke_together");
}

function Bobbie_smoke2(){
	time_forward_minutes(45);
	
	global.has_food = false;
	with (Item){
		if (!is_template){
			if (calories > 0){
				global.has_food = true;	
			}
		}
	}
	
	if (!global.has_food){
		Bobbie.likability += 3;
		Bobbie.high += 20;
		Player.high += 20;
		exelan("msg_Bobbie_smoke_together_nofood");
	}else{
		Bobbie.likability += 6;
		Bobbie.high += 30;
		Player.high += 30;
		Bobbie.desire_stuffing += 10;
		
		global.food_left = 3;
		with (Item){
				if (!is_template){
					if (calories > 0 && global.food_left ){
						global.food_left --;
						item_consume(id, Bobbie);
						item_consume(id, Player);
						instance_destroy();	
					}
				}
			}
		if (!Bobbie.first_stuffing){
			Bobbie.first_stuffing = true;
			exelan("msg_Bobbie_smoke_together_hasfood_firsttime");
		}else{
			exelan("msg_Bobbie_smoke_together_hasfood_afterfirsttime");
		}
	}	
}