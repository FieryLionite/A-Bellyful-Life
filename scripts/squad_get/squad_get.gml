/// @description squad_get(Squad index)
/// @param Squad index
function squad_get(argument0) {
	var squad = global.squads[argument0];

	if (squad[? "front center"] != noone)
	    return squad[? "front center"];
    
	if (squad[? "front left"] != noone)
	    return squad[? "front left"];
    
	if (squad[? "front right"] != noone)
	    return squad[? "front right"];
    
	return noone;



}
