function ctb_cmd_set_speaker(speaker){
	if (is_string_a_number(speaker))
		speaker = object_get_name(speaker);
		
	if (speaker == "noone" || speaker == "system"){
		global.dialogue_char = noone;
		return;	
	}
	
	//show_message(asset_get_index(speaker));
	global.temp = asset_get_index(speaker);
	with (CharacterHolder){
		if (character.id ==global.temp.id){
			focus_holder(id);
		}
	}
	global.dialogue_char = global.temp;
}

function make_set_speaker_cmd(speaker){
	//if (is_string_a_number(speaker))
		//speaker = asset_get_index(speaker);
	
	return ("[set_speaker:"+object_get_name(speaker)+"]");
}

function cmd_speaker(speaker){
	if (speaker == noone)
		return "[speaker:noone]";
	return ("[set_speaker:"+object_get_name(speaker)+"]");
}

function make_expression_cmd(expression){
	var cmd = "[ex:"+str(expression)+"]";
	if (argument_count > 1)	
		cmd = make_set_speaker_cmd(argument[1]) + cmd;
	return (cmd);
}

function cmd_ex(expression){
	var cmd = "[ex:"+str(expression)+"]";
	if (argument_count > 1)	
		cmd = make_set_speaker_cmd(argument[1]) + cmd;
	return (cmd);
}

function ctb_cmd_set_expression(expression){
	//var char = asset_get_index(speaker);
	var char = global.dialogue_char;
	if (char == noone)
		return;
		
	if (!is_string_a_number(expression))
		expression = get_expression_index(expression);
		
	char.expression = real(expression);
}

function ctb_cmd_set_sound(snd){
	snd = asset_get_index(snd);
	audio_play_sound(snd, 0, 0);
}

function ctb_cmd_animate_speaker(speaker,animation){
	var char = asset_get_index(speaker);
}

function ctb_cmd_set_background(bg){
	background_set(asset_get_index(bg));
}

function ctb_cmd_next_background(speaker,animation){
	var char = asset_get_index(speaker);
}

function cmd_sound(snd){
	return 	"[sound:" + audio_get_name(snd) + "]";
}

function get_expression_index(ex){
	ex = string_replace(ex, "ex_", "");
	switch (ex){
		case "idle":
			return ex_idle;
		case "talk":
			return ex_talk;
		case "smile":
			return ex_smile;
		case "smile2":
			return ex_smile2;
		case "blush":
			return ex_blush;
		case "sad":
			return ex_sad;
		case "surprise":
			return ex_surprise;
		default:
			show_message("ERROR EX: " + ex);
	}
}