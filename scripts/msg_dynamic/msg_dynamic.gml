function msg_dynamic() {
	//msg_dynamic(message_string, speed_key_optional);
	//Sets drawing offset to the middle top of the sprite
	var xm = (sprite_width/2) - sprite_xoffset;
	var ym = -sprite_yoffset;

	//sprites used for the text box, you can change them
	var grid_sprite = spr_msg_grid;
	var arrow_sprite = spr_msg_arrow;

	//This is the speed at which the text is drawn. You may change it:
	var text_speed = 0.6;
	if (argument_count>1){
	    if (keyboard_check(argument[1])==true || skipping){
	    //this is the boosted text speed
	    text_speed = 2;
	    skipping = false;
	    }
	}

	var msg_org = argument[0];
	var msg = string_copy(msg_org, 1, min(floor(char + text_speed), string_length(msg_org)));
	//The 200 there is the maximum width the text box can have before wrapping the text to the next line:
	var max_width = min(string_width(string_hash_to_newline(msg_org)), 400);
	var max_height = string_height_ext(string_hash_to_newline(msg), -1, max_width);

	//draw textbox
	//top left corner
	draw_sprite_part(grid_sprite, 0, 0, 0, 16, 16, (x + xm) - ((max_width/2)+16), (y + ym) - (max_height + 32));
	//top right corner
	draw_sprite_part(grid_sprite, 0, 32, 0, 16, 16, (x + xm) + (max_width/2), (y + ym) - (max_height + 32));
	//top part
	draw_sprite_part_ext(grid_sprite, 0, 16, 0, 16, 16, (x + xm) - (max_width/2), (y + ym) - (max_height + 32), max_width/16, 1, c_white, 1);
	//bottom left corner
	draw_sprite_part(grid_sprite, 0, 0, 32, 16, 16, (x + xm) - ((max_width/2)+16), (y + ym) - 16);
	//left part
	draw_sprite_part_ext(grid_sprite, 0, 0, 16, 16, 16, (x + xm) - ((max_width/2)+16), (y + ym) - (max_height + 16), 1, max_height/16, c_white, 1);
	//bottom right corner
	draw_sprite_part(grid_sprite, 0, 32, 32, 16, 16, (x + xm) + (max_width/2), (y + ym) - 16);
	//right part
	draw_sprite_part_ext(grid_sprite, 0, 32, 16, 16, 16, (x + xm) + (max_width/2), (y + ym) - (max_height + 16), 1, max_height/16, c_white, 1);
	//bottom part
	draw_sprite_part_ext(grid_sprite, 0, 16, 32, 16, 16, (x + xm) - (max_width/2), (y + ym) - (16), max_width/16, 1, c_white, 1);
	//center part
	draw_sprite_part_ext(grid_sprite, 0, 16, 16, 16, 16, (x + xm) - (max_width/2), (y + ym) - (max_height + 16), max_width/16, max_height/16, c_white, 1);
	//arrow
	draw_sprite(arrow_sprite, 0, (x + xm), (y + ym));
	//text
	draw_text_ext((x + xm) - (max_width/2), (y + ym) - (max_height + 16), string_hash_to_newline(msg), -1, max_width);
	//other
	char += text_speed;

	//message complete
	return (char >= string_length(msg_org))



}
