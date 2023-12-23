if (micro_girl != noone)
	draw_sprite_ext(sprite, 0, room_width/2, room_height*1.8/3, 0.6, 0.6, 0, c_white, 1);
	
if (girl.is_pregnant and type == WOMB){
	count+=0.2;
	var gscale = (girl.womb_capacity/1500)*40;
	draw_sprite_ext(girl.slime_sprite, count, room_width/2, room_height*1.8/3, gscale, gscale, 0, c_white, 1);	
}