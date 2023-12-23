var i_d = ds_map_find_value(async_load, "id");
//show_message(string(i_d) + "|" + string(global.save_async));
if i_d == global.save_async
{
    if ds_map_find_value(async_load, "status")
    {
        //if ds_map_find_value(async_load, "result") != ""
        //{
			//show_message("HERE");
            var notes = ds_map_find_value(async_load, "result");
			save_all("save" + str(global.save_index_async)+ ".json");
			var save_metadata = ds_map_create();
			save_metadata[? "Day"] = day;
			save_metadata[? "$"] = money;
			save_metadata[? "Notes"] = notes;
			save_metadata[? "Version"] = global.version;
			if (ds_map_exists(global.metadata, str(global.save_index_async)))
				ds_map_delete(global.metadata, str(global.save_index_async));
	
			ds_map_add_map(global.metadata, str(global.save_index_async), save_metadata);
			save_map_to_file(global.metadata, "metadata.json");
			global.save_index = noone;
        //}
    }
}