//TODO: FIX
if (room != rmMassage)
	event_inherited();

if (is_map()){
	x = -1000;
}else if (room == rmMassage){
	x = xstart - 80;	
}

if (room == rmStartOutside){
	image_alpha = wave(0.2, 1, 2, 0);
}else
	image_alpha = 1;