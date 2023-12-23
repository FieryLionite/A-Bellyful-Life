/// @description dialogue_create(index, question, type, response, icon)
/// @param index
/// @param  question
/// @param  type
/// @param  response
/// @param  icon(opt)
function dialogue_create() {
	with (obj_textbox) instance_destroy();

	var d;
	d[0] = argument[1];
	d[1] = argument[2];
	d[2] = argument[3];
	
	var icon = sprBlank;//sprArrowDialogue;//sprBubble;
	if (argument_count == 5)
		icon = argument[4];

	ds_map_add(global.dialogues, argument[0], d);
	ds_map_add(global.dialogies_icons, argument[0], icon);
	return d;



}

