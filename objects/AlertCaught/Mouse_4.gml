if (enabled){
	/*time_left = random_range(2.5,5)*30;
	time_start = time_left;
	enabled = false;
	
	x = random(room_width-sprite_width);
	y = random(room_height - sprite_height);*/
	Remi.catching =  global.last_room;
	Remi.catch_success = false;
	Remi.catch_dialogue = true;
	room_goto( global.last_room);
}