function init_data_excludes(){
	data_excludes = ds_map_create();
	for (var i=0; i<argument_count; i++){
		data_excludes[? argument[i]] = true;
	}
}

function append_data_excludes(){
	//data_excludes = ds_map_create();
	for (var i=0; i<argument_count; i++){
		data_excludes[? argument[i]] = true;
	}
}

function instance_save(inst_id){
	var data = ds_map_create(),
		var_names = variable_instance_get_names(inst_id),
		excludes = -1;
	if (variable_instance_exists(inst_id, "data_excludes"))
		excludes = inst_id.data_excludes;
		
	for (var i=0; i < array_length (var_names); i++){
		var vname = var_names[i];
		if (vname == "data_excludes" || (excludes != -1 && ds_map_exists(excludes, vname)))
			continue;
		
		var value = variable_instance_get(inst_id, vname);
		data[? vname] = value;
	}
	
	return data;
}

function instance_load_new(data, obj_idx){
	var inst = instance_create_depth(0,0,0,obj_idx);
	instance_load_existing(data, inst);
	return inst;
}

function instance_load_existing(data, inst_id){
	var excludes = -1;
	if (variable_instance_exists(inst_id, "data_excludes"))
		excludes = inst_id.data_excludes;
	
	var vname = ds_map_find_first(data);
	for (var ii =0; ii < ds_map_size(data); ii++){
		if (excludes != -1 &&ds_map_exists(excludes, vname)){
			vname = ds_map_find_next(data, vname);
			continue;
		}
		
		var value = data[? vname];
		variable_instance_set(inst_id, vname, value);
		vname = ds_map_find_next(data, vname);
	}
}

function save_map_to_file(map, fname){
	var content =json_encode(map);
	var file = file_text_open_write(working_directory + fname);
	file_text_write_string(file, content);
	file_text_close(file);		
}

function read_map_from_file(fname){
	var content = file_read_all(fname);
	return json_decode(content);
}