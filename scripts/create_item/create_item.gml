///create_item(template)
function create_item(argument0) {
	var template = argument0;
	/*with (template) {
	    nw = instance_copy(false);
	}
	var item = template.nw;
	item.is_template = false;
	return item;*/
	//instance_dupplicate(template);
	var item = instance_dupplicate(template);
	item.is_template = false;
	return item;

}
