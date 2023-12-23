function character_buttplug_scene(){
	var char = global.dialogue_char;
	global.scene_name = "ButtPlug";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	//global.scene_exit = false;
	//global.show_follower = false;
	global.scene_bgm = true;
	global.scene_do_breath = true;
	
	scene_add_actors(char, noone, noone);
	background_set(global.last_bg);
}

function d_buttplug(char =noone){
	if (char == noone)
		char = global.dialogue_char;
	
	if (char.plugged){
		create_item(IButtPlug);
		refresh_backpack();
		tooltip_start(mouse_x, mouse_y, "Error", "They are already using one!");
		return;
	}
		
	audio_play_sound(sndBlorp, 0,0);
	char.plugged = true;
	var idx = asset_get_index("spr" + object_get_name(char.object_index) + "_ButtPlug_0");
	if (idx == -1){
		ctb_list(noone, noone, "Scene not implemented");
		return;
	}
	
	global.dialogue_char = char;
	global.scene_script = character_buttplug_scene;
	scene_start();
}

function buttplug_use_player(){
	dialogue_init();
	
	dialogue_create(
		"0",
		"Use on self",
		true,
		function(){
			if (!is_location_room(global.last_room) || room == rmShop){
				ctb_msg("You can't use this here, so many people are around!");
				return;
			}
	
			var plug = global.item_window_item;
			with (plug) instance_destroy();
			d_buttplug(Player);	
		}
	)
	
	dialogue_start(true);
}


function buttplug_use_other(char){
	if (char.plugged){
		tooltip_start(mouse_x, mouse_y, "Error", "They are already using one!");
		return;
	}
	
	global.buttplug_target = char;
	var threshold = char.likability + char.desire_inflate;
	if (threshold < 20){
		splash_message("Failed likability + inflate desire check (>=20)")
		ctb_msg(cmd_speaker(char.object_index) + "[ex:surprise] You... you want me to put this up my butt and walk around with it?....",
		"[ex:blush]I'm sorry, this is definitely not happening!.", "[ex:idle][speaker:noone]They seem extremely opposed to the idea. You need to increase their desires or likability by a large amount.");
		return;
	}else if (threshold <40){
		splash_message("Failed likability + inflate desire check (>=40)")
		ctb_msg(cmd_speaker(char.object_index) + "[ex:blush] I'm sorry, I know we're very close and all, but I don't think I can do what you're asking me to do.",
				"[ex:idle][speaker:noone]They seemed interested, but it looked like you'll need to get closer before you can convince them.")
		return;
	}else if (char.desire_inflate < 40){
		ctb_list(function(){d_buttplug(global.buttplug_target);}, noone,"[speaker:noone]" +char.name + " doesn't seem very interested, but still agreed reluctantly (likability -3).");
		char.likability -= 3;
	}else
		ctb_list(function(){d_buttplug(global.buttplug_target);}, noone,"[speaker:noone]" +char.name + " eagerly agreed.");
	
	char.desire_inflate += 4;
	
	//item.target = object_get_name(char.object_index);
	//item.is_hidden = true;
	with (item) instance_destroy();
	
	//d_buttplug(char);	
}

function detach_buttplug(char){
	create_item(IButtPlug);
	char.plugged = false;
	audio_play_sound(sndBlorp, 0,0);
}