if (place_meeting(x,y,item.zone)){
    move_outside_all(point_direction(other.x, other.y, x, y), 3);
}

/*if (image_alpha < 1){
	with (ItemCard){
		if (!dragging && id < other.id)
			image_alpha = 0.5;
	}
	image_alpha = 0.9;
}*/