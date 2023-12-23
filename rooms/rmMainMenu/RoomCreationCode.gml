global.save_index = noone;
global.load_index = noone;
global.dialogies = noone;
global.dialogies_icons = noone;

if (!file_exists(working_directory + "metadata.json")){
	global.metadata = ds_map_create();
	var content =json_encode(global.metadata);
	var file = file_text_open_write(working_directory + "metadata.json");
	file_text_write_string(file, content);
	file_text_close(file);	
}else{
	global.metadata = json_decode(file_read_all(working_directory + "metadata.json"));
	if (global.metadata == -1){
		show_message("Unfortunately, it seems your save data has been corrupted. Resetting save data!");
		global.metadata = ds_map_create();
		var content =json_encode(global.metadata);
		var file = file_text_open_write(working_directory + "metadata.json");
		file_text_write_string(file, content);
		file_text_close(file);	
	}
	//show_debug_message("HERE")
	//show_message(file_exists(working_directory + "metadata.json"))
}