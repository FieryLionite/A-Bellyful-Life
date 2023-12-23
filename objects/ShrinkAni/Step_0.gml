if (size > 0.15){
	y = lerp(ystart, room_height - sprite_get_height(sprite_index)*0.15, 1-size/(1-0.15));
	if (started)
		size *= 0.95;
	//size -= 0.05;
	if (size <= 0.15){
		
		global.dialogue_char = character;
		dialogue_init();
		if (Player.micro_stomach == noone)
			dialogue_create("a", "Oral", true, function(){
				global.internal_type = ORAL;
				global.internal_girl = Player;
				Player.micro_stomach = object_get_name(character.object_index);
				start_move();
			});
			
		if (Player.micro_bowels == noone and !Player.is_pregnant)
			dialogue_create("b", "Anal", true, function(){
				global.internal_type = ANAL;
				global.internal_girl = Player;
				Player.micro_bowels = object_get_name(character.object_index);
				start_move();
			});
			
		if (Player.micro_womb == noone)
			dialogue_create("c", "Unbirth", true, function(){
				global.internal_type = WOMB;
				global.internal_girl = Player;
				Player.micro_womb = object_get_name(character.object_index);
				start_move();
			});
		dialogue_start();
	}
}else{
	size = 0.15;	
		
	if(speed > 0 and point_distance(x,y,tx,ty) < speed*1.5){
		y = room_height - sprite_get_height(sprite_index)*0.15;
		speed = 0;
		effect_create_above(ef_ellipse, x+sprite_width/2, y+sprite_height/y, 2, c_pink);
		alarm[0] = 30;
		visible = false;
	}
}

image_xscale = size;
image_yscale = size;