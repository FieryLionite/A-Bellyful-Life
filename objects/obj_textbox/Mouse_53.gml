//hardcoded
if (mouse_x  < 118 and mouse_y > 559 and mouse_y < 607)
	is_finished = true;
	
if (mouse_x  > 118 and mouse_x < 180 and mouse_y > 559 and mouse_y < 607){
	clipboard_set_text(current_text);
	audio_play_sound(pageflip3, 0, 0);
}