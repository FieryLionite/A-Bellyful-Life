/// @description girl_template_init(item1, item2, ...)
/// @param item1
/// @param  item2
/// @param  ...
function girl_template_init() {

	for (var i = 0; i < argument_count; i ++){
	    instance_create(-200,-200, argument[i]);    
	}



}
