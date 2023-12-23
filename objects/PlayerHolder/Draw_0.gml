if (is_location()){
	var faceh = (86-27)*2*0.6, facew=(86-27)*2*0.6;
	
	if (char.micro_stomach != noone){
		var icon = asset_get_index("spr"+char.micro_stomach+"Face");
		draw_set_color(c_white);
		draw_line_width(x - 20, 720-350+faceh/2, 1152+char.skew_x, 396,3);
		draw_set_color(c_black);
		draw_sprite_ext(icon, 0, x - 20, 720-350, 0.6, 0.6, 0, c_white, 1);
		/*draw_rectangle(x - 20-facew/2, 720-350,
				 x - 20 +facew/2, 720-350 + faceh,1);*/
		if (mouse_check_button_pressed(mb_left) and 
			point_in_rectangle(mouse_x,mouse_y, x - 20-facew/2, 720-350,
				 x - 20 +facew/2, 720-350 + faceh)){
				 global.internal_girl = char;
				 global.internal_type = ORAL;
				room_goto(rmInternalView);
			}
	}

	if (char.micro_womb != noone){
		var icon = asset_get_index("spr"+char.micro_womb+"Face");
		draw_set_color(c_white);
		draw_line_width(x - 20, 720-277+faceh/2, 1142+char.skew_x,484,3);
		draw_set_color(c_black);
		//draw_rectangle(x - 20-facew/2, 720-277,
				 //x - 20 +facew/2, 720-277 + faceh,1);
		draw_sprite_ext(icon, 0, x - 20, 720-277, 0.6, 0.6, 0, c_white, 1);
		if (mouse_check_button_pressed(mb_left) and 
			point_in_rectangle(mouse_x,mouse_y, x - 20-facew/2, 720-277,
				 x - 20 +facew/2, 720-277 + faceh)){
				 global.internal_girl = char;
				 global.internal_type = WOMB;
				room_goto(rmInternalView);
			}
	}

	if (char.micro_bowels != noone){
		var icon = asset_get_index("spr"+char.micro_bowels+"Face");
		draw_set_color(c_white);
		draw_line_width(x - 20, 720-202+faceh/2, 1164+char.skew_x,514,3);
		draw_set_color(c_black);
		//draw_rectangle(x - 20-facew/2, 720-202,
		//		 x - 20 +facew/2, 720-202 + faceh,1);
		draw_sprite_ext(icon, 0, x - 20/* + char.skew_x*/, 720-202, 0.6, 0.6, 0, c_white, 1);
		if (mouse_check_button_pressed(mb_left) and 
			point_in_rectangle(mouse_x,mouse_y, x - 20-facew/2, 720-202,
				 x - 20 +facew/2, 720-202 + faceh)){
				 global.internal_girl = char;
				 global.internal_type = ANAL;
				room_goto(rmInternalView);
			}
	}
}
skew_draw(sprite_index ,image_index, x, y, image_xscale, image_yscale);


 if(char.statuses_count[? "pill_lactation"] > 0){
	 var sprL = sprite_index;
	var lpos = coords_breast_get(char.object_index),
		x3 = x + lpos.x3*image_xscale + char.skew_x*(1-lpos.y3/sprite_get_height(sprL)),
		y3 = y+ lpos.y3*image_yscale;
		lactate(x3,y3,char.statuses_count[? "pill_lactation"]);
	draw_sprite_ext(sprSplotch3, 0, x3, y3, 0.4,0.4,0, c_white, 1);// char.alphaL);
}

if (char.using_mpump){
	var sprMPump = getMPumpSprite(char, "Back");
		
	if (sprMPump >= 0){
		skew_draw(sprMPump ,0, x, y, image_xscale, image_yscale);
	}
}

/*if (keyboard_check(vk_delete)){
	show_message(str(image_xscale) + ", " + str(image_yscale))
	test=  0;
}*/
