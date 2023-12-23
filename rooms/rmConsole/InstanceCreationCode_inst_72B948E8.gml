target_script = function(){
	var cmd = get_string("Enter Command", obj_console.text);
	obj_console.text = cmd;
	obj_console.text_changed = true
}