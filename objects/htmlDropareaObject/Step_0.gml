if (os_browser == browser_not_a_browser){
	//sprite_index = winDropareaSprite;
	exit;
}

/// @desc dropbox update event

// check for files dropped
dropbox.CheckFiles();

image_alpha = dropbox.exists; // hide area if it's not exists
image_index = dropbox.IsFileUnder();  // check if file is under dropping area