if (splash_time > 0){	
	//draw_set_font(fnt_large);
	
	var swidth = string_width(splash_text);	
	var sheight = string_height(splash_text);
	draw_set_color(splash_color);
	var padding = 10;
	draw_rectangle(room_width/2 - swidth/2 - padding, room_height - padding*2 - sheight,
		room_width/2 + swidth/2 + padding, room_height - padding , false);
	draw_set_color(c_black);
	draw_text(room_width/2 - swidth/2, room_height - padding - sheight, splash_text);
	
	
	//draw_set_font(fnt_normal);
	draw_set_color(c_black);
	splash_time --;
}

