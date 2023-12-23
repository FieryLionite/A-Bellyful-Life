sprite_index = character.sprite_index;

if (!character.is_npc){
   // draw_sprite_ext(character.sprite_index, character.fat_level*2+character.belly_size, x,y, 1,1,0, c_white, 1);
   var spr_name = "spr" + object_get_name(character.object_index) + "_" + string(character.fat_level);
   if (ButtonMap.last_map == rmMapResort)
		spr_name += "_Resort";
   else if (global.settings[? "Christmas"])
		spr_name = "spr" + object_get_name(character.object_index) + "_Christmas_" + string(character.fat_level);
    
   var sprite = asset_get_index(spr_name);
   // draw_sprite_ext(sprite, character.belly_index, x,y, 1,1,0, c_white, 1);
   
   //POP!
	if (character.popping){
		shader_set(shaderBlur)
		shader_set_uniform_f(ControlEnv.usize,512,512,8)//width,height,radius
		draw_sprite_ext(sprite, character.belly_index, x,y, 1,1,0, c_white, 1);
		shader_reset()
	}else{
	   skew_draw_other(character, sprite, character.belly_index, x,y);
	   if (!global.settings[? "Christmas"])
			skew_draw_other(character, character.sprite_expression, character.expression, x,y);
			
		if(character.statuses_count[? "pill_lactation"] > 0){
			var lpos = coords_breast_get(character.object_index),
				x1 = x + lpos.x1 + character.skew_x*(1-lpos.y1/sprite_get_height(sprite)),
				y1 = y+ lpos.y1,
				x2 = x + lpos.x2 + character.skew_x*(1-lpos.y2/sprite_get_height(sprite)),
				y2 = y+ lpos.y2;
			lactate(x1,y1,character.statuses_count[? "pill_lactation"]);
			lactate(x2,y2,character.statuses_count[? "pill_lactation"]);
			draw_sprite_ext(character.sprL1, 0, x1, y1, 0.6,0.6,character.angleL1, c_white, character.alphaL);
			draw_sprite_ext(character.sprL2, 0, x2, y2, 0.6,0.6,character.angleL1, c_white, character.alphaL);
		}
	}
 
    //draw_sprite_ext(character.sprite_expression, character.expression, x,y, 1,1,0, c_white, 1);
}else{		
		draw_sprite(character.sprite_index, character.image_index, x,y);
}

if (character.using_mpump){
	var sprMPump = getMPumpSprite(character, "Front");
		
	if (sprMPump >= 0){
		skew_draw_other(character, sprMPump ,0, x, y);
	}
}