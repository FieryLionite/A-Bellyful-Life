function UI_hide() {
	if (!is_location() || instance_exists(obj_textbox) 
	|| instance_exists(dropdown_dialogue) || !StickerEye.image_index){
		//    visible = false;
		x = -1000;
		return true;
	}
	    //visible = true;
	x = xstart;
	return false;


}
