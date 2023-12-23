draw_self();
if (!global.abilities[? ability]){
    draw_set_font(fnt_popup);
    draw_set_color(c_black);
    theight = string_height(string_hash_to_newline(ability_get_cost(ability)));
    twidth = string_width(string_hash_to_newline(ability_get_cost(ability)));
    draw_text(x - twidth/2, y - theight/2, string_hash_to_newline(string(ability_get_cost(ability))));
}else{
    image_index = 1;
}

