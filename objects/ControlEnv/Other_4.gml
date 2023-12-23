room_counter = 0;
if (global.upload_content != noone){
	if (global.upload_content == ""){
		show_message("Error reading file, got blank!");
		exit;
	}
	//TODO FIX PLS
	global.upload_content = string_replace_all(global.upload_content, "true", 1);
	global.upload_content = string_replace_all(global.upload_content, "false", 0);
	
	load_all_text(global.upload_content);
	global.upload_content = noone;
	game_start = false;
	alarm[0] = -1;
	exit;
}

if (global.save_index != noone){
	prevNotes = "";
	if (ds_map_exists(global.metadata, str(global.save_index))){
		var prevData = global.metadata[? str(global.save_index)];
		prevNotes = prevData[? "Notes"];
	}
	global.save_async = get_string_async("Notes:", prevNotes);
	global.save_index_async = global.save_index;
	global.save_index = noone;
	exit;
}

if (global.load_index != noone){
	resort_days = 0;
	go_resort = false;
	var checkData = global.metadata[? str(global.load_index)];
	if (checkData[? "Version"] == "0.1.2"){
		show_message("Warning! Save File is from previous version, some things may not work as expected.");
	}
	
	load_all("save" + str(global.load_index)+ ".json");
	global.load_index = noone;
	game_start = false;
	exit;
}else if (game_start){
	game_start = false;
	//var new_name = undefined;
	//while (is_undefined(new_name))	
//		new_name = get_string("Enter your name:", "Ayume");

	Player.name = global.name;// str(get_string("Enter your name:", "Ayume"));
}


if (is_location()){
	if (!global.skip_refresh_location)
		refresh_location();
	else{
		global.skip_refresh_location = false;	
		room_persistent = false;
	}
}

if (global.scene_from != noone && room == global.scene_from){
	global.scene_from = noone;	
	scene_start();
}