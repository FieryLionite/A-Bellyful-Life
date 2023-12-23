/// @description initializing
if (os_browser == browser_not_a_browser){
	sprite_index = winDropareaSprite;
	exit;
}
	
// create list of all file names
files = ds_list_create();

// init extension interface
dropbox = new htmlDroparea();

// create drag-n-drop area
dropbox.Create(x, y, sprite_width, sprite_height);

// set handler for file drop event
dropbox.SetFileHandler(function(file) {
	// add file name to a list of files
	ds_list_add(files, file.name);
	// copy file to local storage for any operations
	file.CopyToAsync("copied_" + file.name, function(path) {
		// read and show first line
		var f = file_text_open_read(path);
		//show_message();
		upload_action(file_text_read_string(f));
		file_text_close(f);
	});
});

draw_set_font(fnt);
