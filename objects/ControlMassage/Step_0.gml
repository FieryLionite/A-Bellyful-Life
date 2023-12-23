if instance_exists(ItemCard) and point_distance(ItemCard.x, ItemCard.y, mouth_x, mouth_y) < 100
{
	ControlEnv.room_counter = 0;
	global.dialogue_char = char;		
	
	with (ItemCard){
		script_execute(item.script_use_on_char, other.char);
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

image_index = (char.belly_size/100) * (image_number-1);

char.desire_stuffing = org_desire_stuffing + char.lust;

if (!undressed and char.lust >= 70){
	sprite_index = asset_get_index("spr"+name+"_Undressed_0");
	sprExpression = asset_get_index("spr"+name+"_UndressedEx_0");
	sprShadow = sprBlank;

	undressed = true;	
	
	var bcoords = coords_belly_get("Undressed", char.object_index);
	var mcoords = coords_feed_get("Undressed", char.object_index);

	belly_x = x - sprite_xoffset + bcoords.belly_x;
	belly_y = y - sprite_yoffset + bcoords.belly_y;

	mouth_x = x - sprite_xoffset + mcoords.feed_x;
	mouth_y = y - sprite_yoffset + mcoords.feed_y;
}

if (char.lust > 100){
	char.lust = 100;
	with (ToolLick) instance_destroy();
	with (ToolMassage) instance_destroy();
	ctb_msg("She is knocked out from the pleasure.")
}

if (char.stress > 100){
	char.stress = 100;
	with (ToolLick) instance_destroy();
	with (ToolMassage) instance_destroy();
	ctb_msg("She is too stressed to continue.")
}