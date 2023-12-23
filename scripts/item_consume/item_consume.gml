function item_consume(item, target){
	if (item.do_expire && item.expire_in < 0){
		ctb_list(noone, noone, "Item expired");
		return;	
	}
	
	if (item.high > 0){
		var found = false;
		var pipe = noone;
		with (ISmokingPipe){
			if (!is_template && !in_fridge){
				found = true;
				pipe = id;
			}
		}
		if (!found){
			item.uses++;
			item.uses = max(item.uses, 1);
			//show_message(item.uses);
			ctb_list(noone, noone, "You need a smoking pipe to use this!");
			return;
		}else{
			effect_create_above(ef_smokeup, mouse_x, mouse_y, 2, c_gray);	
			pipe.uses --;
			if (pipe.uses <= 0)
				with (pipe)instance_destroy();
		}
	}
	
	change_mood(target, item.volume/10, true);
	item.bites = 0;
	
	var internal_sprite = sprite_get_name(item.sprite_index)+"_xr";
	var internal_spriteID = asset_get_index(internal_sprite);
	if (global.portal_entrance == noone || global.portal_entrance == ORAL){
		target.stomach_food += item.volume;
		if (internal_spriteID > -1)
			ds_list_add(target.stomach_queue, internal_sprite);
		else if (item.liquid_color != noone)
			ds_list_add(target.stomach_queue, string(item.liquid_color));
	} else {
		target.bowels_food += item.volume;
		if (internal_spriteID > -1)
			ds_list_add(target.bowels_queue, internal_sprite);
		else if (item.liquid_color != noone)
			ds_list_add(target.bowels_queue, string(item.liquid_color));
	}

	target.undigested_calories += item.calories;
	
	if (global.portal_entrance == noone)
		eat_sound(item);
	else{
		target.expression = ex_blush;
		target.alarm[11] = 60;
		audio_play_sound(sndPortal, 0, 0);
		if (floor(random(3)) == 0){
			ctb_msg(cmd_speaker(target.object_index)+choose(
					"I felt...strange",
					"My stomach feels weird...",
					"Eh??",
					"(She seemed startled and stared at her belly)"
				))
		}
	}
		
	if (item.energy > 0){
		change_energy(target, item.energy, 1);
		target.jittery += item.energy;	
	}
	if (item.alcohol > 0){
		target.alcohol += item.alcohol;
	}
	if (item.high > 0){
		target.high += item.high;
	}
	if (item.use_items != noone){
		for (var i =0; i < ds_list_size(item.use_items);i++){
			var item_use = item.use_items[| i];
			item_apply_item(item_use, target);
		}
	}
	item.uses --;
}

function item_consume_part(item, target){
	if (item.do_expire && item.expire_in < 0){
		ctb_list(noone, noone, "Item expired");
		return;	
	}
	change_mood(target, item.bite_volume/10, true);
	item.bites --;
	target.stomach_food += item.bite_volume;
	target.undigested_calories += item.bite_calories;
	if (item.alcohol > 0){
		target.alcohol += item.bite_alcohol;
	}
	if (item.high > 0){
		target.high += item.bite_high;
	}
	eat_sound(item);

	if (item.bite_energy > 0){
		change_energy(target, item.bite_energy, 1);
		target.jittery += item.bite_energy;	
	}
	if (item.bites <= 0){
		if (item.use_items != noone){
		for (var i =0; i < ds_list_size(item.use_items);i++){
			var item_use = item.use_items[| i];
			item_apply_item(item_use, target);
		}
	}	
	}
}

function d_item_consume(){
	global.player_eat_item = ItemWindow.item;
	dialogue_init();
		if ( ItemWindow.item.bites > 1){
			dialogue_create(
			"1",
			strlan(EN, "Take a bite", RUS, "Откусить", JP, "一口食べる", CN, "咬一口"),
			true,
			d_player_bite
			)
		}
		
		dialogue_create(
		"2",
		strlan(EN, "Eat everything", RUS, "Есть все", JP, "すべてを食べる", CN, "什么都吃"),
		true,
		d_player_consume
		)
	dialogue_start(true);
}

function d_player_bite(){
	item_consume_part(global.player_eat_item, Player)
}

function d_player_consume(){
	if (global.player_eat_item.do_expire && global.player_eat_item.expire_in < 0){
		ctb_list(noone, noone, "Item expired");
		return;	
	}
	
item_consume(global.player_eat_item, Player);
if (global.player_eat_item.uses <= 0)
	with (global.player_eat_item) instance_destroy();
else
	global.player_eat_item.uses --;
//show_message(global.player_eat_item.use)
with (ControlBackpack) refresh_backpack();
}

function item_give_consume(char){
		//item is food
		if ((char.desire_stuffing < 30 && char.stomach_content/char.stomach_capacity >= 0.5) ||
				(char.desire_stuffing < 70 && char.stomach_content/char.stomach_capacity >= 0.9)	||
				(char.stomach_content/char.stomach_capacity >= 1.2)){
				ctb_list(noone, noone,  choose(
					"Thank you, but I'm not hungry right now.",
					"Sorry but I'm full."
					),
					strlan(
						EN, "(You might get her to eat more if you increase her interest in stuffing)",
						RUS, "(Вы можете заставить ее есть больше, если увеличите ее интерес к начинке)", 
						JP, "（スタッフィングへの関心を高めると、彼女にもっと食べさせるかもしれません）", 
						CN, "（如果你增加她对馅料的兴趣，你可能会让她吃得更多）"
						)
					);		
					
				return false;
			}
			var likeAdd = random(1);
			char.likability += likeAdd;
			splash_message("Likability +" + string(likeAdd),c_lime,60)
			char.desire_stuffing *= 1.05;
			
			if (global.language == EN)
				ctb_list(noone, noone, choose(
					"thanks!",
					"yum!",
					"thank you"
				));
				else
					strlan(EN, "Thanks!", RUS, "Спасибо!", JP, "ありがとう！", CN, "谢谢!");
			
			item_consume(item, char);
			return true;
}

function item_on_item(otherItemCard){
	if (otherItemCard.item.is_pill || otherItemCard.item.is_tool || otherItemCard.item.is_template){
		//ctb_list(noone, noone, "
		return;	
	}
	
	if (otherItemCard.item.use_items == noone){
		otherItemCard.item.use_items = ds_list_create();	
	}else if (ds_list_size(otherItemCard.item.use_items) >=5){
		ctb_list(noone, noone, "There's no more space left!");
		return;
	}
	ds_list_add(otherItemCard.item.use_items, item.object_index);
	item.uses --;
	item.bites--;
}

function item_apply_item(item, target){
	//show_message(object_get_name(item))
	 item = create_item(item);
	global.temp_target = target;
	//hack to pretend item is its ItemCard
	item.item = item;
	with (item){
		if (script_use != noone){
			script_execute(script_use, global.temp_target);
		}
		 instance_destroy();
	}
	//with (item) instance_destroy();
}