move_towards_point(tx,ty,spd);
if (point_distance(x,y,tx,ty) < 50){
	tx = random(room_width);	
	ty = random(room_height);
}

if (shrinking){
	image_xscale *= 0.92;	
	image_yscale *= 0.92;
	if (image_xscale < 0.1){
		item.is_hidden = false;
		instance_destroy();	

	}
}