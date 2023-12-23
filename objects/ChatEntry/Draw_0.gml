x = BtChat.x;
draw_cached();
draw_set_font(fntTiny)
if (y < 0)
    instance_destroy();

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(x,y, x + CHAT_WIDTH, y + height, false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_text_ext(x + 5, y + padding, string_hash_to_newline(text), 14, CHAT_WIDTH);

draw_load_cache();

depth = -100;