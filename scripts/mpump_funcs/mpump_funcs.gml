function getMPumpSprite(char, side){
		return asset_get_index("spr"+object_get_name(char.object_index)+"_MPump"+side+"_" + str(char.fat_level))
}

function mpump_on_char(char){
	var threshold = char.likability + char.desire_inflate;
	if (threshold < 20){
		ctb_msg(cmd_speaker(char.object_index) + "[ex:surprise] You... you want me to put this up my butt and walk around with it?....",
		"[ex:blush]I'm sorry, this is definitely not happening!.", "[ex:idle][speaker:noone]They seem extremely opposed to the idea. You need to increase their desires or likability by a large amount.");
		return;
	}else if (threshold <40){
		ctb_msg(cmd_speaker(char.object_index) + "[ex:blush] I'm sorry, I know we're very close and all, but I don't think I can do what you're asking me to do.",
				"[ex:idle][speaker:noone]They seemed interested, but it looked like you'll need to get closer before you can convince them.")
		return;
	}else if (char.desire_inflate < 40){
		ctb_msg("[speaker:noone]" +char.name + " doesn't seem very interested, but still agreed reluctantly (likability -3).");
		char.likability -= 3;
	}else
		ctb_msg("[speaker:noone]" +char.name + " eagerly agreed.");
	
	char.desire_inflate += 4;
	
	if (char.using_mpump){
		tooltip_start(ItemWindow.x, ItemWindow.y, "Error", "They are already using one!");
		return;
	}
	
	if (item.batteries <= 0){
		tooltip_start(room_width/2-200, 100, "Error", "You need to recharge the batteries!");
		return;
	}
	
	item.target = object_get_name(char.object_index);
	item.is_hidden = true;
	
	char.using_mpump = true;
}

function d_mpump_player(){
	dialogue_init();
	
	dialogue_create(
		"0",
		"Use on self",
		true,
		start_mpump_player
	)
	
	dialogue_start(true);
}

function start_mpump_player(){
	var mpump = global.item_window_item;
	if (Player.using_mpump){
		tooltip_start(ItemWindow.x, ItemWindow.y, "Error", "You are already using one!");
		return;
	}
	
	if (mpump.batteries <= 0){
		tooltip_start(room_width/2-200, 100, "Error", "You need to recharge the batteries!");
		return;
	}
	
	mpump.target = "Player";
	mpump.is_hidden = true;
	
	Player.using_mpump = true;
	
	
}

function detach_mpump(){
	with (IMiniPump){
		if (target == object_get_name(global.dialogue_char.object_index)){
			target = "";
			is_hidden = false;
		}
	}
		
	 global.dialogue_char.using_mpump = false;
}