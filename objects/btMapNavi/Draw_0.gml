if (ControlEnv.minutes != minutes){
	alarm[9] = 1;
	minutes = ControlEnv.minutes;
}

if (target_room == global.last_dest && target_room != rmShop) ||
	(target_room == rmShop && global.clicked_shop_bt == id && global.shop_bg == shop_bg){
	image_alpha = 	cos(current_time/250) + 1;
}

if (target_room!= noone and npc != noone){
	var sprFace = asset_get_index(
		"spr" + object_get_name(npc.object_index) + "Face");
	draw_sprite_ext(sprFace, 0, x , y + 10 + sprite_height, 0.6,0.6,0, c_white, 1);
}

draw_self();

image_alpha = 1;

draw_cached();
if (global.language != EN && global.language != RUS)
	draw_set_font( fntTiny);
else
	draw_set_font( fontReport);
draw_set_halign(fa_center);

if (display == "")
	display = name;

var width = string_width(display),
	height = string_height(display);
y += yy;

draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(x - width/2 - 15, y-3, x + width/2+15, y + height - 4, 0);
draw_set_alpha(1);

draw_set_color(make_color_rgb(255,102,0));
draw_text(x,y,display);
draw_load_cache();
y -= yy;