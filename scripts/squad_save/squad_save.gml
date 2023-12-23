function squad_save() {
	for (var i = 1; i <= global.squad_num; i ++){
	    ds_map_secure_save(global.squads[i], "squad" + string(i));
	}
	dialogue_ok("Yay!", "Game saved sucessfully");



}
