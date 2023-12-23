// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dialogue_init(){
	if (ds_exists(global.dialogies, ds_type_map))
		ds_map_destroy(global.dialogues);
	if (ds_exists(global.dialogies_icons, ds_type_map))
		ds_map_destroy(global.dialogies_icons)
	global.dialogues = ds_map_create();
	global.dialogies_icons = ds_map_create();
	return global.dialogues;
}


function dialogue_start(can_dismiss){
	if (ds_map_size(global.dialogues) == 0)
		return noone;
	
	can_dismiss = is_undefined(can_dismiss) ? false : can_dismiss;
	var d =  instance_create(0,100, dropdown_dialogue);
	d.can_dismiss = can_dismiss;
	return d;
}
