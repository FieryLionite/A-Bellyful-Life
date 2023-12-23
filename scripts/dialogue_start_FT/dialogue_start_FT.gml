/// @description dialogue_start(script)
/// @param script
function dialogue_start_FT(argument0) {

	if (!ds_map_exists(global.missions_done, room)){
	    global.dialogue = argument0;
	    if (!Gate.running)
	        gate_goto(rmDialogue);
	    else
	        custom_goto(rmDialogue);
	}else{
	    gate_goto(rmMainMenu);
	}



}
