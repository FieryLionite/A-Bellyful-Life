function pill_lactation(target){
	if (global.settings[? "Christmas"])
		splash_message("Lactation doesn't work with Christmas outfits!",c_red, 200);
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_lactation", 60*4);
	item_consume(item,target);
}

function pill_digest(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_digest", 60*24);
	item_consume(item,target);
}

function pill_diet(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_diet", 60*24);
	item_consume(item,target);
	target.fat_calories -= 300;
}

function pill_gas(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_gas", 60*4);
	target.desire_inflate ++;
	splash_message("inflate desire +1",c_lime);
	item_consume(item,target);
}

function pill_noise(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_noise", 60*3);
	item_consume(item,target);
}

function pill_laxative(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_laxative", 60);
	item_consume(item,target);
}

function pill_slime(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	//character_add_status(target, "pill_noise", 60*3);
	if (!target.is_pregnant and target.micro_stomach == noone){
		target.is_pregnant = true;
		item_consume(item,target);
	}else{
		splash_message("Target is already pregnant!");	
	}
}

function pill_shrink(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	if (target.object_index == Player){
		ctb_msg("You used the shrink pill but there was no effect. This is because the dev hasn't implemented this event. (It should only be used on other girls and not yourself).")	
		return;
	}else{
		if (Player.micro_bowels != noone and Player.micro_stomach != noone
			and Player.micro_womb != noone){
				ctb_msg("You already swallowed one girl for each cavity (stomach, bowels, uterus)!")		
				return;
			}
		
		
		//character_add_status(target, "pill_shrink", 120);
		target.shrink = 120;
		item_consume(item,target);
		global.target_shrink = target;
		with (CharacterHolder){
			if (character.id == global.target_shrink.id){
				var ani = instance_create_depth(x,y, -10, ShrinkAni);
				ani.character = character;
				ani.sprite_index = sprite_index;
				ani.image_index = image_index;
				instance_destroy();
			}
		}
	}
}

function pill_notify(status_name, d_script, minutes){
	var char = global.dialogue_char;
	if (object_index == Player)
		return;
	
	global.dialogue_char  = object_index;
	//show_message("1." + str(minutes) +", "+ status_name + ", " +str(status_notify[? status_name]) + ", "
		//+ str(in_dialogue()) + ", " +str(is_character_in_room(id)) + str(room_get_name(script_location())));
	if (status_notify[? status_name] > 0 && !in_dialogue() && is_character_in_room(id)){
			status_notify[? status_name] -= minutes;
			//show_message(str(minutes) +", "+ status_name + ", " +str(status_notify[? status_name]) + ", "
		//+ str(in_dialogue()) + ", " +str(is_character_in_room(id)));
			if (status_notify[? status_name] <= 0){
					d_script();
					return;
			}//else
				//show_message(str(status_notify[? status_name]) )
		}	
	global.dialogue_char  = char;
}

function character_add_status(target, status, duration){
	//show_message(target)
	ds_list_insert(target.statuses[? status], 0, duration); 
	with (target)character_status_step(0);
}

function character_status_step(minutes){
	//if (lactating > 0){
	//		lactating -= minutes;
	//	}
	
	var target = id;
	set_all_map_entries_to_value(target.statuses_count, 0);
		
	var key = ds_map_find_first(target.statuses);
	for (var i=0; i < ds_map_size(target.statuses); i++){
		var list = target.statuses[? key];
		for (var j=0; j < ds_list_size(list); j++){
			list[| j] -= minutes;
			if (list[| j] > 0){
				target.statuses_count[? key] ++;
			}else{
				ds_list_delete(list, j);
				j--;
			}
		}
		key = ds_map_find_next(target.statuses, key);
	}
}