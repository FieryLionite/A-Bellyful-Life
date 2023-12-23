ready = true;
draw_self();

draw_cached();

draw_set_font(fnt_dialogue);
draw_set_color(c_black);
draw_text(x,y,  title);
draw_set_font(f_normal);
draw_set_color(c_white);
draw_text_ext(x,y+50,  text, -1, sprite_width - sprite_xoffset*2);

draw_load_cache();