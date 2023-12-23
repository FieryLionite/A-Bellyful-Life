if (instance_exists(StickerEye) and !StickerEye.image_index)
	exit;

draw_sprite(sprDialogueBox, 0, 0, 5);

draw_cached();
ctb_draw();//
draw_set_font(fontReport);


/*draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(35, y - 20, 300, y+10, false);
draw_set_alpha(1);
draw_set_color(c_aqua);*/
var dialogue_speaker = "System";
if (variable_global_exists("dialogue_char") and instance_exists(global.dialogue_char) && global.dialogue_char > 0){
    dialogue_speaker = global.dialogue_char.name;
	//show_message(object_get_name(global.dialogue_char));
}else
	dialogue_speaker = "System"
//show_message(speaker)

draw_text(213, y-30, dialogue_speaker);// string_hash_to_newline(speaker));
    

draw_load_cache();
//draw_sprite_ext( char_sprite, 0, x+6+29*1.5, y+6+29*1.5,  1.5, 1.5, 0, c_white, 1);

