function squad_load() {
	for (var i = 1; i <= global.squad_num; i ++){
	    global.squads[i] = ds_map_secure_load("squad" + string(i));
  
  
	}






}
