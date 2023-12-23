if (os_browser == browser_not_a_browser){
	var fname = get_open_filename("save file|*.json", "");
	if (fname == "")
		exit;
	var content = file_read_all(fname);
	upload_action(content);
}