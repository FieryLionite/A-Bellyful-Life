visible = (char.lust >= 70)

if (dragging){
	x = mouse_x;
	y = mouse_y;
	
	
	if (position_meeting(x,y,ControlMassage)){
		image_speed = 0.2;
	}else
		image_speed = 0;
}else{
	if (point_distance(x,y,xstart, ystart) > 30){
		x += (xstart - x)/5;
		y += (ystart - y)/5;
	}else{
		x = xstart;
		y = ystart;
	}
	image_speed = 0;
}