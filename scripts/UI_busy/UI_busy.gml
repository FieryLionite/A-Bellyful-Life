function UI_busy() {
	//returns true during dialogue, cutsecnes, or windows

	return instance_exists(obj_textbox) || instance_exists(dropdown_dialogue)
	    || instance_exists(Window);



}
