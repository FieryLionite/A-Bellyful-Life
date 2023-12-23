if (!visible)
	exit;
	
var idx = floor((mouse_y - y) / (sprite_height/3));

global.internal_girl = global.dialogue_char;
if (idx == 0){
	global.internal_type = ORAL;
}else if (idx == 1){
	global.internal_type = WOMB;
}else {
	global.internal_type = ANAL;
}



room_goto(rmInternalView);