is_template = item.is_template;
if (is_template)
	exit;

//if no one in dialogue, it means player is using item
if (global.dialogue_char == noone)
	global.dialogue_char = Player;

if (mouse_x > x + sprite_width/2){
	with (item) instance_destroy();
	with (card) instance_destroy();
}else{
	if (item.script_use != noone){
		global.item_window_item = item;
		var func = item.script_use;
		func();
	}
}

if (!is_template)
    with (ControlBackpack) refresh_backpack();
if (instance_exists(item) && item.consumable && item.bites <= 0){
	if (item.uses <= 0)
		with (item) instance_destroy();
	//else
		//item.uses --;
}
	
instance_destroy();
    


