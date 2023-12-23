event_inherited();

if (target != noone)
	image_index = round(clamp((1 - target.mood/100)*image_number, 0, image_number-1));