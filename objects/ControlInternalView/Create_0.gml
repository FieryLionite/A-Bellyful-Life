type = global.internal_type;
girl = global.internal_girl;

count = 0;

/*
type = WOMB;
sprite = asset_get_index("sprAmber_Micro_0");
queue = ds_list_create();
ds_list_add(queue, "sprApple_xr", "sprHotdog_xr"
		, "sprApple_xr", "sprSundea_xr", "sprCakeSlice_xr", "sprApple_xr", "sprHotdog_xr",
		string(#ff8585), string(#ff85ff), string(#c2ff85));
fraction = 0.5;
*/
micro_girl = noone;

var bg;
switch (type){
		case ANAL:
			 bg = bgBowels;
			 queue = girl.bowels_queue;
			 //fraction = get_bowels_content(girl)/get_bowels_capacity(girl);
			 fraction = girl.bowels_water/get_bowels_capacity(girl);
			 if (girl.micro_bowels != noone)
				micro_girl = asset_get_index(girl.micro_bowels);
		break;
		case ORAL:
			bg = bgStomach;
			queue = girl.stomach_queue;
			fraction = girl.stomach_water/get_stomach_capacity(girl);
			//fraction = 0;
			 if (girl.micro_stomach != noone)
				micro_girl = asset_get_index(girl.micro_stomach);
		break;
		case WOMB:
			bg = bgWomb;
			queue = girl.womb_queue;
			fraction = 0;
			 if (girl.micro_womb != noone)
				micro_girl = asset_get_index(girl.micro_womb);
		break;
}

background_set(bg);

num_items = clamp(fraction*2*10, 0, 10);
scale_items = clamp(fraction*12, 0, 8);

var water = instance_create_depth(0,0,0,obj_water);
water.fraction = fraction;

alarm[0] = 1;


if (micro_girl != noone){
	sprite = asset_get_index("spr"+object_get_name(micro_girl.object_index)+"_Micro_0");
	if (sprite == -1)
		show_message("spr"+object_get_name(micro_girl.object_index)+"_Micro_0");
}