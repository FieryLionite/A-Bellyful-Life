function scene_start(){
	if (room == rmScene)
		return;
	if (argument_count == 1)
		global.scene_script = argument[0];
	
	global.scene_fg = sprBlank;
	
	if (room != rmBackpack)
		global.last_room = room;
	global.scene_exit = true;
	global.scene_pressure_match = false;
	global.scene_bgm = false;
	global.scene_playing = true;
	global.scene_sound_action =  noone;
	global.scene_sound_sporadic =  ds_map_create();
	global.scene_sound_sporadic_rate = -1;
	global.scene_inflate_rate = 1;
	global.scene_allow_insert = false;
	global.scene_show_pump = false;
	global.scene_show_bag = false;
	global.scene_interface = true;
	global.scene_do_breath = false;
	global.show_follower = true;
	global.allow_stream = false;
	global.streaming = false;
	ds_list_clear(global.scene_actors);
	custom_goto(rmScene);
}

function scene_play(){
	global.scene_playing = true;
}

function scene_pause(){
	global.scene_playing = false;
}

function scene_exit(){
	custom_goto( global.last_room);
}

///scene_add_actor(ActorID, spritename, oral/anal, inflate_type)
function scene_add_actors(){
		for (var i=0; i < argument_count; i++){
			ds_list_add(global.scene_actors, argument[i]);
		}
}

function scene_set_actor(){
	var char = argument[0];
	for (var a=0; a < ds_list_size(global.scene_actors); a++){
		if (global.scene_actors[| a] == char){

			for (var i=1; i < argument_count; i++){
				global.scene_actors[| a+i] = argument[i];
			}
				return;
		}
	}
}

function scene_auto_sound(entrance, type){
	switch(entrance){
		case ORAL:
		break;
		case ANAL:
		break;
	}
	
	switch(type){
		case WATER:
		break;
		case AIR:
		break;
	}
}

function repulsed_message(){
	global.show_follower = false;
	if (Yumi.following)
		return;
	
	follow_char = noone;
	with (Character){
		if (following && in_house())
			other.follow_char = id;
	}
	if (follow_char != noone){
		global.dialogue_char = follow_char;	
		follow_char.following = false;
		ctb_list(noone, noone, "Ehhhh what are you doing?? I'll pretend I never saw that! (She covered her eyes and ran outside)");
		//global.dialogue_char = noone;
	}
}

function scene_check_actor(char){
	for (var i=0; i < ds_list_size(global.scene_actors);i+=3){
		var actor_id =global.scene_actors[| i]
		if (actor_id.id == char.id)
			return true;
		//else if (keyboard_check(vk_backspace))
			//show_message(string(actor_id.id) + ", " + string(char.id))
	}
	return false;
}

function scene_start_from(rm){
	global.scene_from = rm;
	custom_goto(rm);
}