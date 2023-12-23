draw_self();

if (ds_map_exists(metadata, str(index))){
	draw_cached();
	draw_set_color(c_black);
	draw_set_font(fnt_dialogue);
	var data = metadata[? str(index)];
	draw_text(x + 10, y + 10, string_hash_to_newline(map_to_string(data)));
	
	draw_load_cache();
}