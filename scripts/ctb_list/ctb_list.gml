
function smart_text_replace(text){
	text = string_replace_all(text, "$PlayerName", Player.name);
	return text;
}

/// @description ctb_list(finish script, finish room, text, text, text...)
/// @param finish_script
/// @param  finish_room
/// @param  text
function ctb_list() {
	//var d = argument[0]
	//with(obj_textbox) instance_destroy();
	
	var d = instance_create(5,room_height-125,obj_textbox);
	d.finish_script = argument[0];
	d.finish_room = argument[1];
	d.char_sprite = sprBlank;

	for (var i = 2; i < argument_count; i ++){
	    var text = argument[i];
	   with (d) ctb_add_text(  smart_text_replace(text) );
	}

	return d;
}

function ctb_msg(){
	var d = obj_textbox;
	//if (!instance_exists(obj_textbox)){
		d = instance_create(5,room_height-125,obj_textbox);
		d.finish_script = noone;
		d.finish_room = noone;
		d.char_sprite = sprBlank;
	//}

	for (var i = 0; i < argument_count; i ++){
	    d.temp = argument[i];
	   with (d) ctb_add_text( temp );
	}
}

function ctb_append(){
	var d = obj_textbox;
	if (!instance_exists(obj_textbox)){
		d = instance_create(5,room_height-125,obj_textbox);
		d.finish_script = noone;
		d.finish_room = noone;
		d.char_sprite = sprBlank;
	}

	for (var i = 0; i < argument_count; i ++){
	    d.temp = argument[i];
	   with (d) ctb_add_text( temp );
	}
}