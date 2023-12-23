event_inherited();
char = Player;
if (room == rmScene &&  global.show_follower){
	with (Character){
		if (object_index != Player && following && in_house() && !scene_check_actor(id)){
			other.char = id;
			//if (keyboard_check(vk_backspace))
			//	show_message(name + string(other.x))
		}
	}
}

 var spr_name = "spr" + object_get_name(char.object_index) + "_Back_" + string(char.fat_level);
 
 if (ButtonMap.last_map == rmMapResort)
	spr_name += "_Resort";	
 else if (global.settings[? "Christmas"])
	spr_name = "spr" + object_get_name(char.object_index) + "_Back_Christmas_" + string(char.fat_level);
 

 
sprite_index = asset_get_index(spr_name);
image_index = (char.belly_size/100) * (image_number-1);
//image_index = //char.belly_index;
skew_xoffset = Player.skew_xoffset;
skew_step();

//if (keyboard_check(vk_delete))
	//show_message(global.show_follower &&  room == rmScene  && (char != Player || !scene_check_actor(Player)))
	
//show self if dialogue is player
if ( (room != rmScene && is_location() && !is_map() && (instance_exists(obj_textbox) || instance_exists(dropdown_dialogue))) /*|| room == rmBackpack*/ ||
	(global.show_follower &&  room == rmScene  && (char != Player || !scene_check_actor(Player)))){
	x = xstart;
	//if (keyboard_check(vk_delete))
		//	show_message(sprite_get_name(sprite_index)  + "_" + str(depth) + "_" +str(ControlScene.depth) + "_" + str(image_alpha));
}/*else if (is_map()){ //UI elements should show in map, but not PlayerHolder!
	x = -1000;
}*/

if (instance_exists(ItemCard) && !place_meeting(x,y,ItemCard)){
		image_alpha = 0.5;
}else
	image_alpha = 1;

/*if (room == rmScene && (!global.show_follower || char == Player)){
	x = -1000;
}*/