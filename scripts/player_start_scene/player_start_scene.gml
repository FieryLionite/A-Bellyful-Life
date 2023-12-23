function player_start_scene(){
	global.scene_name = "Start";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.scene_exit = false;
	global.show_follower = false;
	global.scene_bgm = true;
	
	coins_reset();
	//scene_add_actors(Player, noone, noone);
	background_set(sprSceneStart);
	create_item(IHouseKeys);
	exelan("msg_player_start");
}