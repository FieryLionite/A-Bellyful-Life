if (!instance_exists(obj_console)){
show_message_async("Failed to initialize console. Please start the game first.")
room_goto(rmSettings);
exit;
}

obj_console.close_on_click = false;
with (obj_console){
	display_direction = display_open_speed
		
	predict_y2_draw = predict_y1 // close the predict 
		
	history_x2 = display_get_gui_width()-pos_margin_sides // I do this on open as well incase its changed
	main_x2 = history_x2
	predict_x2 = main_x2	
}