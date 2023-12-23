draw_cached();
draw_self();
if (on){
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(x,y, room_width, room_height, false);
	draw_set_alpha(1);
	
    draw_set_color(c_white);
    draw_rectangle(x,y, room_width, y + 30, false);
    draw_set_color(c_black);
    draw_text(x+5, y+5, string_hash_to_newline("Viewers: "+ string(viewers)));
    
    donations_msg =  "$"+string(round(donations));
    draw_text(room_width - string_width(string_hash_to_newline(donations_msg)), y+5,string_hash_to_newline(donations_msg));
}

draw_load_cache();