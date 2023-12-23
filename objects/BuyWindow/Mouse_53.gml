if !in_dialogue() && (mouse_x < x || mouse_x > x + sprite_width ||
    mouse_y < y || mouse_y > y + sprite_height)
    instance_destroy();
