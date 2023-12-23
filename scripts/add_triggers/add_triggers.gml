function add_triggers() {
	for (var i = 0; i < argument_count; i ++){
	    var trigger = instance_create(0,0, argument[i]);
	    ds_list_add(triggers, trigger);
	}



}
