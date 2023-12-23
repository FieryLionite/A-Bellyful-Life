event_inherited();

draw_self();

hr = string(event_start_hour);
if (event_start_hour < 10)
    hr = "0" + hr;
min_str = string(event_start_minute);
if (event_start_minute < 10)
    min_str = "0" + min_str;
	
draw_cached();

draw_set_color(c_black);
draw_set_font(f_normal);
draw_set_halign(fa_center);
draw_text(x + sprite_width/2,y+10, event_name);
draw_text(x + sprite_width/2,y+35, event_location);
draw_text(x + sprite_width/2,y+60, string_hash_to_newline( hr + ": " + min_str));
//string(event_start_hour)+" : " + string(event_start_minute));


draw_load_cache();