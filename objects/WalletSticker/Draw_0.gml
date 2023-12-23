draw_self();

draw_cached();
draw_set_color(c_green);
draw_text(x,y,"$" + string(ControlEnv.money));
draw_load_cache();