selectW = sprite_width/4;//sprite_get_width(sprStatusSelect);
selectH = sprite_get_height(sprStatusSelect);
draw_sprite(sprStatusSelect, 0, x + (sprite_width/4)*select*0.9 + selectW/2, y-selectH);

draw_self();