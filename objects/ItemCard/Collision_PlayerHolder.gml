if (!dragging)
	exit;

with (ItemWindow) instance_destroy();
if (item.script_use != noone){
	if (ControlEnv.counter % 60 == 0){
		if (item.script_use != d_item_consume)
			item.script_use();
		else
			item_consume_part(item, Player);
		
	}
}
	
//if (!item.is_template)
   
	
if (item.consumable && item.bites <= 0){
	if (item.uses <= 0)
		with (item) instance_destroy();
}
	
if (!instance_exists(item))	{
	instance_destroy();
	 with (ControlBackpack) refresh_backpack();
}