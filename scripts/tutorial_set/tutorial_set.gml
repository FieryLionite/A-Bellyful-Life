function tutorial_set(argument0) {
	global.tutorial_sprite = argument0;
	global.last_room = room;
	gate_goto(rmTutorial);



}
