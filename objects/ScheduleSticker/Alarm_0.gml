with (object_index){
	if (visible && id != other.id && y >= other.y)
		if (id > other.id)
			other.y += sprite_height;
}
if (firstPass){
	firstPass = false;
	alarm[0] = 1;
}