character = global.dialogue_char;
//sprite_index = character.sprite_index;
//draw_sprite_ext(character.sprite_index, character.fat_level*2+character.belly_size, x,y, 1,1,0, c_white, 1);
//draw_sprite_ext(character.sprite_expression, character.expression, x,y, 1,1,0, c_white, 1);

draw_set_color(c_white);
draw_set_font(fnt_dialogue)
if (global.abilities[? "status"]){
    draw_text(366, 153, string_hash_to_newline("Capacity: " + string(character.stomach_content)
        + "/" + string(character.stomach_capacity) + "(" + 
        string(round(character.stomach_content/character.stomach_capacity*100)) + "%)"));
    draw_text(366, 468, string_hash_to_newline("Capacity: " + string(character.bowels_content)
        + "/" + string(character.bowels_capacity) + "(" + 
        string(round(character.bowels_content/character.bowels_capacity*100)) + "%)"));
}else{
    draw_text(366, 153, string_hash_to_newline("Capacity: " + "Ability locked"));
    draw_text(366, 468, string_hash_to_newline("Capacity: " + "Ability Locked"));
}
    

