function get_back() {
	global.refresh_upgrade = true;

	//show_message(room_get_name(global.last_room) + ", " + room_get_name(room));
	if (global.combat_room == noone){
	    if (global.last_room != room)
	        gate_goto(global.last_room);
	    else
	        gate_goto(rmMainMenu);
	}
	else
	    gate_goto(global.combat_room);



}
