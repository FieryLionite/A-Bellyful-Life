if (!instance_exists(item)){
	instance_destroy();
	exit;
}
draw_cached();

draw_set_color(make_colour_rgb(201,70,38));
draw_set_alpha(0.5*image_alpha);
draw_rectangle(x,y,x+width, y + height, false);
draw_set_alpha(1*image_alpha);
if (item.use_items == noone)
	draw_set_color(c_orange);
else
	draw_set_color(c_red);
draw_line_width(x, y, x + width, y, 2);
draw_line_width(x, y+height, x+width, y+height, 2);
draw_line_width(x+width, y, x + width, y+height, 2);
draw_line_width(x, y, x, y+height, 2);

var color = c_white;
if (item.do_expire && item.expire_in < 0){
		color = c_black;
}

draw_sprite_ext(item.sprite_index, item.image_index, 
    x +(5 + item.sprite_width)*item.scale/2, y +( 5 + item.sprite_height)*item.scale/2, item.scale, item.scale, 0, color, image_alpha);

draw_set_color(c_black);
if (item.show_name){
	var display = global.item_names[? item.name][| global.language];
    draw_set_font(fnt_popup)
    draw_text(x+5,y + 5, string_hash_to_newline(display));
}

if (item.show_volume){
    draw_set_font(fnt_popup)
    draw_text(x+5,y + 50, string_hash_to_newline(string(item.volume) + "cc"));
}

if (place_meeting(x,y,CharacterHolder) && global.settings[? "Enable Portals"]){
		var holder = instance_place(x,y,CharacterHolder)
		draw_set_color(c_orange);
		draw_line_width(holder.x, holder.y + holder.sprite_height*0.35, 
					holder.x + holder.sprite_width, holder.y + holder.sprite_height*0.35, 5);
		draw_sprite_ext(sprPortal, 0, mouse_x, mouse_y, 1,1, ControlEnv.room_counter, c_white, 1);
	}
	
draw_load_cache();