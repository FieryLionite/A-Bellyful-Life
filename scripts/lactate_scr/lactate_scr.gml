function lactate(xx,yy,count){
	if (floor(random(30*3/count)) == 0){
		instance_create_depth(xx,yy,-100, MilkDrop);
	}
}