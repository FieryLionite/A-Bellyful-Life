function battle_turn() {
	//dialogue_ok("Battle msg", "There are no turn limits in this battle!");
	gate_goto(noone);

	var allies = 0;
	var hostiles = 0;

	for (var i = 0; i < instance_number(CheckPoint); i ++){
	    var node = instance_find(CheckPoint, i);
	    var squad = instance_place(node.x ,node.y, Squad);
	    if (squad != noone)
	        node.side = squad.side;
        
	    if (node.side == 1){
	        allies ++;
	    }else if (node.side == 2){
	        hostiles ++;
	    }
    
	}

	if (ControlMission.do_move){
	    for (var i = 0; i < instance_number(Squad); i ++){
	        var squad = instance_find(Squad, i);
	        if (squad.side == 2){
	            var nn = squad.node.next_node;
	            if (nn != noone)
	                nn = node_get(nn);
	            if (nn != noone){
	                var existing = instance_place(nn.x, nn.y, Squad);
	                if (existing == noone || (existing.node != nn) || (existing.side != squad.side)){
	                    squad.moveTo = nn;
	                }
	            }
	        }
	    }   
	}

	var hostile_presence = false;
	for (var i = 0; i < instance_number(Squad); i ++){
	    var squad = instance_find(Squad, i);
	    if (squad.side == 2)
	        hostile_presence = true;
	}


	//Lost mission
	if (allies == 0){
	    dialogue_ok("Battle msg", "All allied checkpoints have been taken over, the mission has been aborted!");
	    room_persistent = false;
	    gate_goto(rmMainMenu);
	}

	if (hostiles == 0 || !hostile_presence){
	    //dialogue_ok("Battle msg", "Mission accomplished!");
	    room_persistent = false;
	    if (global.d_end == noone)
	        gate_goto(rmMainMenu);
	    else
	        dialogue_start(global.d_end);
        
	    global.missions_done[? room] = true;
	}



}
