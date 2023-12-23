init_data_excludes("blur", "usize", "location", "room_counter");
instance_create_depth(0,0,0,obj_console);
instance_create_depth(0,0,0,SplashMessage);
if (global.load_index == noone)
	alarm[0] = 2;
snowing = true;
global.skip_refresh_location = false;
global.show_follower = false;
global.values = ds_map_create();
global.scene_actors = ds_list_create();
global.scene_sound_action =  noone;
global.scene_sound_sporadic =  ds_map_create();
global.scene_sound_sporadic_rate = -1;
global.watched_inflate = false;
global.scene_from = noone;
global.portal_entrance = noone;
global.last_bg = noone;
global.shop_bg = sprBlank;
global.clicked_shop_bt = noone;

global.status_tab = 0;

global.dialogies = noone;
global.dialogies_icons = noone;
global.debugging = false;
go_resort = false;
resort_days = 0;
game_start = true;
battery = 30*60*3;

coins_reset();

global.last_dest = rmBedroom;

audio_group_load(sndGroup_walk);

/*audio_play_sound(sndWind, 0, 1);
audio_play_sound(sndRain, 0, 1);

audio_sound_gain(sndWind, 0, 0);
audio_sound_gain(sndRain, 0, 0);*/

has_bike = false;
has_umbrella = false;
has_tripod = false;

raining = 0;
minutes = 30;
hours = 6;
day = 0;
fat_essences = 0;
//show_debug_overlay(true);
screen_lock = false;
//ctb_list(noone, noone, "test", "test2");

stat_init();
abilities_init();
//show_debug_message("before init")
//show_debug_message(string(Player)+", "+string(FatbucksCashier))
item_init(Player, Bambi, Aria, Aya, Yumi,  Amber, Bobbie, Remi, DEB, 
	FatbucksCashier, FatdonaldsCashier, FataurantCashier, ResortCashier
	,  Bartender, Nurse);
//instance_create(-200,-200, );
//show_debug_message("affter init")
    //Librarian);
item_init(ICocktail1, ICocktail2, ICocktail3, ICocktail4, IBeer,
IPump, IMiniPump, IApple,IOrange, ICakeSlice, INextLine,
IEspresso, IFrappuccino, IGreenTeaFrap, IOrangeJuice, ISoda, ISundea, IMilk,
	IHamburger, IHotdog, IHugeburger, IFries,
	 IPillDiet, IPillDigest, IPillGas, IPillNoise, IPillLaxative, IPillShrink,IPillLactation,IPillSlime,
		IBottleDiet, IBottleDigest, IBottleGas, IBottleNoise, IBottleLaxative,
		IBottle, IBottleWater, IUmbrella,
		IBike, ITripod, ILostWallet, IHouseKeys, ISlime,
IWeedBag, IWeedBagExotic, ISmokingPipe,ICigarettePack,
IButtPlug, IVibrator, IEnemaBag);
var bottle = create_item(instance_find(IBottleWater,0));
bottle.in_fridge = true;
bottle = create_item(instance_find(IBottleWater,0));
bottle.in_fridge = true;

//create_item(instance_find(IMiniPump,0));
//create_item(instance_find(IButtPlug,0));
//create_item(instance_find(IVibrator,0));
//create_item(instance_find(IPillDiet,0));
//create_item(instance_find(IBottleDiet,0));
for (i = 0; i <10; i ++){
    var cake = create_item(instance_find(ICakeSlice,0));
	cake.in_fridge = true;
	
	//cake = create_item(instance_find(IPillSlime,0));
	//cake = create_item(instance_find(IPillShrink,0));
}

location = noone;

global.dialogue_char = noone;
global.zone_stomach = noone;
global.zone_bowels = noone;
global.dialogue_char = noone;
register_location_close_times();

//Player.name = get_string("Please enter your name:", "Bobbie");

alarm[10] = 100;

money = 500;

counter = 0;

global.status_desc = ds_map_create();
global.status_desc[? "pill_digest"] = 
strlan(EN, "(Increase digestion speed by 50% (stackable). Side effects: higher stomach pressure (harder to inflate), gas production, loose some energy over time)",
	CN, "(消化速度加快50%(可叠加).副作用:腹部压力更大(更难使腹部变大), 产生气体,以及随着时间流逝会消耗一些能量)",
	JP, "（消化速度を50%上昇(重複可)。副作用：胃の圧力が高くなる（膨らみにくくなる）、ガスが発生する、時間の経過とともにエネルギーが低下する。）",
	RUS, "(Увеличивает скорость пищеварения на 50% (складывается). Побочные эффекты: более высокое давление в желудке (труднее надуть), выделение газа, со временем теряется часть энергии)"
);
global.status_desc[? "pill_diet"] = 
strlan(EN,"(Decrease digestion speed by 50%(stackable). Side effects: Max energy temporary reduced by 5%. ",
	CN, "(消化速度减慢50%(可叠加).副作用: 最大能量值减少5%(暂时的)",
	JP, "（消化速度を50%低下させる(重複可)。副作用：最大エネルギーが一時的に５%減少。",
	RUS, "(Уменьшает скорость пищеварения на 50% (складывается). Побочные эффекты: Макс. Энергия временно снижена на 5%. "
);
global.status_desc[? "pill_gas"] = 
strlan(EN,"Increase stomach gas production",
	CN, "增加肚子里气体的产生",
	JP, "胃のガス発生量を増やす。",
	RUS, "Увеличивает газообразование в желудке"
);
global.status_desc[? "pill_noise"] = 
strlan(EN, "Increase stomach noise production",
	CN, "增加肚子里声音的产生",
	JP, "胃のガス発生量を増やす。",
	RUS, "Увеличивает количество шума в желудке"
);
global.status_desc[? "pill_laxative"] = "";
global.status_desc[? "pill_relaxant"] = "";

global.status_desc[? "pill_lactation"] = "";


//shader
blur = -1;
usize = shader_get_uniform(shaderBlur,"size");//uniform for width, height, radius
//depth = -1000;

