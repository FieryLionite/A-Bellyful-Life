/// @description item_init(item1, item2, ...)
/// @param item1
/// @param  item2
/// @param  ...
function item_init() {

	for (var i = 0; i < argument_count; i ++){
		//show_debug_message("item: " + string(argument[i]));
	    instance_create_depth(-200,-200, 0,argument[i]);    
	}



}
