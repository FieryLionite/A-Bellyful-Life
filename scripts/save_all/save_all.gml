function save_all(fname){
	var save = ds_map_create(),
	control = instance_save(ControlEnv),
	characters = ds_map_create(),
	items = ds_map_create();
	
	for (var i=0; i<instance_number(Character);i++){
		var char = instance_find(Character, i),
			cdata = instance_save(char);
		ds_map_add_map(cdata, "statuses", char.statuses);
		ds_map_add_map(cdata, "statuses_count", char.statuses_count);
		ds_map_add_map(characters, object_get_name(char.object_index), cdata);
	}
	
	for (var i=0; i<instance_number(Item);i++){
		var item = instance_find(Item, i),
			idata = instance_save(item),
			use_items = noone;
		
		if (item.use_items != noone){
			 use_items = ds_list_create();
			for (var ii=0; ii<ds_list_size(item.use_items); ii++)
				ds_list_add(use_items, object_get_name(item.use_items[| ii]));
			
			ds_map_add_list(idata, "use_items", use_items);
		}else
			idata[? "use_items"] = noone;
			
		idata[? "item_name"] = object_get_name(item.object_index);
		ds_map_add_map(items, str(i), idata);
	}
	
	ds_map_add_map(save, "control", control);
	ds_map_add_map(save, "characters", characters);
	ds_map_add_map(save, "items", items);
	
	save[? "room"] = room_get_name( global.last_room);
	
	var content =json_encode(save);
	var file = file_text_open_write(working_directory + fname);
	file_text_write_string(file, content);
	file_text_close(file);
}