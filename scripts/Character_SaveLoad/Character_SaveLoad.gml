// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_character(c){
	excludes = list_create("script_location","script_dialogue","script_idle","script_observe",
											"sprite_expression", "sprite_index");
	var data = instance_save(c, excludes);
	ds_list_destroy(excludes);
	data[? "script_location"] = script_get_name(script_location);
	data[? "script_dialogue"] = script_get_name(script_dialogue);
	data[? "script_idle"] = script_get_name(script_idle);
	data[? "script_observe"] = script_get_name(script_observe);
	
	data[? "sprite_expression"] = sprite_get_name(sprite_expression);
	data[? "sprite_index"] = sprite_get_name(sprite_index);
	
	
}

function load_character(data){
	
}