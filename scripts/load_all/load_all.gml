function load_all(fname){
	var data = file_read_all(working_directory + fname);
	load_all_text(data);
	
}

function load_all_text(data){
	with (Item){
		if (!is_template){
			no_custom_destroy = true;
			instance_destroy();
		}
	}
	
	data = json_decode(data);
	var characters = data[? "characters"],
		items = data[? "items"],
		control = data[? "control"];
	
	instance_load_existing(control, ControlEnv);
	
	for (var k = ds_map_find_first(characters); !is_undefined(k); k = ds_map_find_next(characters, k)) {
		 var c = characters[? k],
			  c_index = asset_get_index(k);
			  
		instance_load_existing(c, c_index);
		c_index.statuses = c[? "statuses"];
		c_index.statuses_count = c[? "statuses_count"];
	}
	
	for (var k = ds_map_find_first(items); !is_undefined(k); k = ds_map_find_next(items, k)) {
		 var item = items[? k],
			  item_index = asset_get_index(item[? "item_name"]);//asset_get_index(k),
			  use_items = item[? "use_items"];
			  
		if (item[? "is_template"]){
			continue;
		}
			  
		var new_item = create_item(item_index);
		
		instance_load_existing(item, new_item);
		
		if (use_items != noone){
			new_item.use_items = ds_list_create();
			for (var ii=0; ii < ds_list_size(use_items); ii++){
				ds_list_add(new_item.use_items	, asset_get_index(use_items[| ii]));
			}
		}
	}
	
}