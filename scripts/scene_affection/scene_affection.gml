function scene_hug(){
	global.scene_name = "Hug";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	//global.char_hug
	
	if (global.last_room == rmBedroom){
		background_set(sprBedroomCorner);
	}else
		background_set(sprBedroomResort);
	
	ctb_list(sleep_finish, noone , "z.. z.. z..");
	//sleep_finish();
	with (Player) skew_common();
}