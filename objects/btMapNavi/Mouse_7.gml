if (ControlEnv.room_counter< 20)
	exit;

if (is_shop){
		global.clicked_shop_bt = id;
		//show_message(sprite_get_name(shop_bg))
		/*global.shop_bg = shop_bg;
		global.shop_items = items;	
		global.last_room = room;*/
	}
	
if (target_room != noone){
	/*if (Player.encumbered){
		change_energy(Player, -3, true);
	}*/
	//time_forward_minutes(7);
	//custom_goto(target_room);
	d_route(target_room);
}

if (target_script != noone)
	target_script();