if (dragging){
	x = mouse_x;
	y = mouse_y;
}else{
	if (point_distance(x,y,xstart, ystart) > 30){
		x += (xstart - x)/5;
		y += (ystart - y)/5;
	}else{
		x = xstart;
		y = ystart;
	}
}