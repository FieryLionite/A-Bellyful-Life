/// @description mission_register(stage, title, room)
/// @param stage
/// @param  title
/// @param  room
function mission_register(argument0, argument1, argument2) {
	var mission = ds_map_create();
	var stage = string(argument0);
	if (!ds_map_exists(global.mission_list, stage))
	    global.mission_list[? stage] = ds_list_create();


	mission[? "title"] = argument1;
	mission[? "room"] = argument2;
	ds_list_add(global.mission_list[? stage], mission);



}
