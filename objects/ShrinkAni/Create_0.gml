size = 1;
image_speed = 0;
character = noone;
spd = 10;

tx = x;
ty = y;

start_move = function(){
	tx = PlayerHolder.x + PlayerHolder.sprite_width/2;
	ty = PlayerHolder.y + PlayerHolder.sprite_height/2;
	if (global.internal_type == ORAL)
		ty = PlayerHolder.y;
	direction = point_direction(x,y,tx,ty);
	speed = spd;	
}

started = false;
alarm[1] = 30;