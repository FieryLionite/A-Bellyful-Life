function focus_holder(argument0) {
	var holder = argument0;
	global.dialogue_char = argument0.character;
	with (CharacterHolder){
	    enabled = false;
	}
	argument0.enabled = true;



}
