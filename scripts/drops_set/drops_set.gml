function drops_set() {
	drops = ds_list_create();
	for (var i = 0; i < argument_count; i ++){
	    ds_list_add(drops, argument[i]);
	}



}
