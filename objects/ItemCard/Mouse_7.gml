with(ItemCard) image_alpha = 1;
if (persistent){
	var holder = instance_place(x,y,CharacterHolder);
	if (item.script_use_on_char != noone && instance_exists(holder)){
		ControlEnv.room_counter = 0;
		var char =  holder.character;
		global.dialogue_char = char;
		
		if (!global.settings[? "Enable Portals"])
			script_execute(item.script_use_on_char, char);
		else {
			if (y < holder.y + holder.sprite_height*0.35)
				global.portal_entrance = ORAL;
			else
				global.portal_entrance = ANAL;

			if (item.script_use == d_item_consume){
				item_consume(item, holder.character);
			} else if (item.script_use != noone){
				script_execute(item.script_use);
			}
		}
			
		global.portal_entrance = noone;
		
		if (!instance_exists(item)){
			instance_destroy();
			exit;
		}
			
		if (item.consumable && item.bites <= 0){
			if (item.uses <= 0)
				with (item) instance_destroy();
		}
		instance_destroy();
		
	}
}


if (!persistent)
if (!ControlEnv.screen_lock){
    if (item.is_template){
        win = instance_create(
            0,0,
            BuyWindow);
        win.item = item;
        win.card = id;
    }else if (room == rmKitchenFridge){
		if (item.in_fridge && x >= ControlBackpack.x){
			item.in_fridge = false;
			with (ControlBackpack) refresh_backpack();
			with (ControlFridge) refresh_fridge();
		}else if (!item.in_fridge && x < ControlFridge.x + 300){
			item.in_fridge = true;
			with (ControlBackpack) refresh_backpack();
			with (ControlFridge) refresh_fridge();
		}
	}else if (room == rmCharger){
		if (item.charging && x >= ControlBackpack.x){
			item.charging = false;
			with (ControlBackpack) refresh_backpack();
			with (ControlCharger) refresh_charger();
		}else if (!item.charging && x < ControlCharger.x + 300){
			item.charging = true;
			with (ControlBackpack) refresh_backpack();
			with (ControlCharger) refresh_charger();
		}
	//check item on item in backpack
	}//else{
			var otherItemCard = instance_place(x,y,ItemCard);
			if (drag_counter > 20){
			drag_counter = 0;
				if (item.script_use_on_item != noone && instance_exists(otherItemCard)){
					script_execute(item.script_use_on_item, otherItemCard);
			
					if (item.consumable && item.bites <= 0){
						if (item.uses <= 0){
							with (item) instance_destroy();
							//refresh_backpack();
						}
					}
		
				}
		}
		if (!instance_exists(otherItemCard) || drag_counter <= 20){
			alarm[0] = 1;	
		}
	//}
}

