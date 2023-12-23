function instance_dupplicate(inst_id){
	var nw = instance_create_depth(inst_id.x, inst_id.y,inst_id.depth,  inst_id.object_index);
	var vars = variable_instance_get_names(inst_id)
	for (var i=0; i < array_length (vars); i++){
		var name = vars[i],
			value = variable_instance_get(inst_id, name);
		
		variable_instance_set(nw, name, value);
	}
	
	return nw;
}
/*
function instance_save(inst_id, excludes){
	var data = ds_map_create();
	var vars = variable_instance_get_names(inst_id)
	for (var i=0; i < array_length (vars); i++){
		var name = vars[i];
		if (excludes != undefined){
				exclude = false;
				for (var ii = 0; ii < ds_list_size(excludes); ii++)
					if (excludes[| ii] == name){
						exclude = true;	
					}
				
				if (exclude)
					continue;
		}
		
		var value = variable_instance_get(inst_id, name);
		data[? name] = value;
	}
	
	return data;
}

function instance_load(inst_id, data, excludes){
	var name = ds_map_find_first(data);
	for (var ii =0; ii < ds_map_size(data); ii++){
		if (excludes != undefined){
				exclude = false;
				for (var ii = 0; ii < ds_list_size(excludes); ii++)
					if (excludes[| ii] == name){
						exclude = true;	
					}
				
				if (exclude){
					name = ds_map_find_next(data, name);
					continue;
				}
		}
		
		var value = data[? name];
		variable_instance_set(inst_id, name, value);
		name = ds_map_find_next(data, name);
	}
}

function variables_instance_set(inst_id){
	for (var i=1; i<argument_count; i+=2){
			var name = argument[i],
				value = argument[i+1];
			variable_instance_set(inst_id, name, value);
	}
}*/