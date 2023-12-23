draw_self();
if (checked)
	draw_sprite(sprCheck, 0, x, y);
	
if (display == "")
	display = name;

draw_cached();
draw_set_color(c_black);
draw_set_font(fnt_dialogue);
draw_text(x,y,display);

draw_load_cache();

checked =  global.settings[? name];