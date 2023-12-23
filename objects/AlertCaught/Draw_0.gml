if (!enabled){
	if (!Remi.visiting && floor(random(30*25))==0){
		enabled = true;
		with (btArrowNavi) instance_destroy();
	}
	exit;
}

move_towards_point(tx, ty, 5);
if (point_distance(x,y,tx,ty) < 25){
	tx = random(room_width);
	ty = random(room_height);	
}

draw_self();
time_left --;

draw_healthbar(x, y + 100, x + 290, y + 200, (time_left/time_start)*100, 
	c_dkgray, c_white, c_white, 0, 1, 0);
	
if (time_left < 0){
	Remi.catching =  global.last_room;
	Remi.catch_success = true;
	Remi.catch_dialogue = true;
	room_goto( global.last_room);
	/*if (!instance_exists(obj_textbox)){
		BtPlay.toggled = false;
		BtPause.toggled = true;
	}*/
}