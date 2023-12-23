function save_action(){
	if (instance_exists(Slime)){
		//splash_message("WARNING! Retrieve your slimes first!");
		with (ISlime) is_hidden = false;
	}
	
	with (SaveSticker) {
		if (image_alpha == 1){
			global.save_index = index;	
		}
	}
	
	custom_goto(rmBedroom);
}

function load_action(){
	with (Slime) instance_destroy();
	
	audio_stop_sound(bgm_intro);
	audio_sound_gain(bgmA, 1, 60);
	with (SaveSticker) {
		if (image_alpha == 1){
			global.load_index = index;	
		}
	}
	custom_goto(rmBedroom);
}

function delete_action(){
	if (!show_question("Are you sure you want to delete?"))
		return;
	
	with (SaveSticker) {
		if (image_alpha == 1){
			global.delete_index = index;	
		}
	}
	
	ds_map_delete(global.metadata, str(global.delete_index));
	file_delete(working_directory + "save" +str(global.delete_index) +".json");
	save_map_to_file(global.metadata, "metadata.json");
}

function download_action(){
	with (SaveSticker) {
		if (image_alpha == 1){
			global.download_index = index;	
		}
	}
	
	var content = file_read_all(working_directory + "save" +str(global.download_index) +".json")
	if (os_browser == browser_not_a_browser){
		var fname = get_save_filename("json file|*.json", "save.json");
		if (fname == "")
			exit;
		//show_message(working_directory + fname);
		var file = file_text_open_write(fname);
		file_text_write_string(file, content);
		file_text_close(file);
	}else{
		 var save_name = get_string("Save name:", "Save.json");
		downloadFile(save_name, content);	
	}
}

function upload_action(content){
	global.upload_content = content;
	custom_goto(rmBedroom);
}