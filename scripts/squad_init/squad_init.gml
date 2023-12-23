function squad_init() {
	global.squad_num = 5;
	for (var i = 1; i <= global.squad_num; i ++){
	    squad = ds_map_create();
	    global.squads[i] = squad;
	    squad [? "front left"] = noone;
	    squad [? "front center"] = noone;
	    squad [? "front right"] = noone;
    
	    squad [? "back left"] = noone;
	    squad [? "back center"] = noone;
	    squad [? "back right"] = noone;
	}



}
