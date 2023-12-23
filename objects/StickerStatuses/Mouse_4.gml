xx = mouse_x - x;
if (xx < sprite_width/4){
	select = 0;	
}else if (xx < (sprite_width * 2)/4){
	select = 1;
}else if (xx < (sprite_width * 3)/4){
	select = 2;
}else{
	select = 3;
}