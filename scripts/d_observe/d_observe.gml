function d_observe() {
	var desc = script_execute(global.dialogue_char.script_observe);
    
	if (desc != false){
	    ctb_list(noone, noone, desc);
	}



}
