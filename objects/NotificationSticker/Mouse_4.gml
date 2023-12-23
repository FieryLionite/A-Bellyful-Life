if (!visible || y < 0 || mouse_y < y + 91)
	exit;
	
if (mouse_x > x + 227){
	
}else{
	//custom_goto(event_room);	
}

y = -1000;	
visible = false;

with (object_index){
	if (visible && id != other.id && y > other.y)
		y -= sprite_height;
}