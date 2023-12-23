/// @description squad_pos_set(squad, pos, doll)
/// @param squad
/// @param  pos
/// @param  doll
function squad_pos_set(argument0, argument1, argument2) {
	var squad = global.squads[argument0];
	squad[? argument1] = argument2;
	//show_message("set squad " + string(argument0) + " pos " + argument1 + 
	//    " for " + object_get_name(argument2.object_index));



}
