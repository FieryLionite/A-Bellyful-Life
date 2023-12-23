if (!visible)
	exit;
	
has_pump = false;
has_bag = false;

with (IPump){
	if (!in_fridge and !is_template){
		other.has_pump = true;
	}
}

with (IEnemaBag){
	if (!in_fridge and !is_template){
		other.has_bag = true;
	}
}

if (!has_bag || !has_pump){
	splash_message("You need a hand pump and an enema bag!");
	exit;
}

var select_x = (mouse_x - x)/sprite_width;
var actor = global.scene_actors[| 0];
if (select_x < 1/3){
	image_index = 0;	
	global.scene_inflate_rate = 0;
	scene_set_actor(actor, noone, noone);
	ds_list_clear(global.scene_sound_action);
	global.scene_show_pump = false;
	global.scene_show_bag = false;
	global.scene_do_breath = false;
	global.scene_interface = false;
}else{
	index = -1;
	if (select_x < 2/3){
		index = 1;
	}else{
		index = 2;
	}
	
	if (index == 1 and global.scene_show_pump){
		global.scene_show_pump = false;
		if (global.scene_show_bag)
			image_index = 2;
		else{
			ds_list_clear(global.scene_sound_action);
			image_index = 0;
			global.scene_do_breath = false;
			global.scene_inflate_rate = 0;
		}
	} else if (index == 2 and global.scene_show_bag){
		global.scene_show_bag = false;
		if (global.scene_show_pump)
			image_index = 1;
		else{
			ds_list_clear(global.scene_sound_action);
			image_index = 0;
			global.scene_do_breath = false;
			global.scene_inflate_rate = 0;
		}
	}else if (index == 1 and !global.scene_show_pump){
		global.scene_inflate_rate = 1;
		global.scene_show_pump = true;
		global.scene_do_breath = true;
		global.scene_interface = true;
		scene_set_actor(actor, ANAL, AIR);
		ds_list_clear(global.scene_sound_action);
		ds_list_add(global.scene_sound_action, sndAirpump);
		if (global.scene_show_bag){
			image_index = 3;
			scene_set_actor(actor, ANAL, BOTH);
			ds_list_add(global.scene_sound_action, sndFlowWater);
		}else{
			image_index = 1;	
		}
	}else if (index == 2 and !global.scene_show_bag){
		global.scene_inflate_rate = 1;
		global.scene_show_bag = true;
		global.scene_do_breath = true;
		global.scene_interface = true;
		scene_set_actor(actor, ANAL, WATER);
		ds_list_clear(global.scene_sound_action);
		ds_list_add(global.scene_sound_action, sndFlowWater);
		if (global.scene_show_pump){
			image_index = 3;
			scene_set_actor(actor, ANAL, BOTH);
			ds_list_add(global.scene_sound_action, sndAirpump);
		}else{
			image_index = 2;	
		}
	}
}
ControlScene.alarm[0] = 1;

//show_message(select_x);