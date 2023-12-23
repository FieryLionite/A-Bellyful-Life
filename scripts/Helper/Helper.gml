//#macro str string
function str(arg){
	return string(arg);	
}

function wave(from, to, duration, offset)
{
    var _wave = (to - from) * 0.5;

    return from + _wave + sin((((current_time * 0.001) + duration * offset) / duration) * (pi * 2)) * _wave;
}

function background_set(bg){
	 //__background_set( e__BG.Index, 0, bg );	
	 var lid =  layer_background_get_id("Background");
	  layer_background_sprite(lid, bg);
}

function background_get(){
	 var lid =  layer_background_get_id("Background");
	 return layer_background_get_sprite(lid);
	// return __background_get( e__BG.Index,0);
}


function get_random_asset(name, idx_min, idx_max){
	asset_name = name + string(round(random_range(idx_min, idx_max)));
	idx = asset_get_index(asset_name);	
	//show_message(asset_name + ", " + string(idx));
	return idx;
}

function draw_cached(){
	prev_font = draw_get_font();
	prev_halign = draw_get_halign();
	prev_color = draw_get_color();	
}

function draw_load_cache(){
	draw_set_font(prev_font);
	draw_set_halign(prev_halign);
	draw_set_color(prev_color);
}

function set_all_map_entries_to_value(map, value){
	var key = ds_map_find_first(map);
	for (var i=0; i < ds_map_size(map); i++){
		map[? key] = value;
		key = ds_map_find_next(map, key);
	}
}

function sound_get_volume(snd){
	switch(snd){
		case sndFlowWater:
			return 0.4;
	}

	return 1;
}

function audio_is_playing_all(){
	for (var i=0; i<argument_count; i++)
		if (audio_is_playing(argument[i]))
			return true;
	return false;
}

function in_dialogue(){
	return (instance_exists(obj_textbox) || instance_exists(dropdown_dialogue));	
}

function audio_stop_sound_later(){
	audio_stop_sound(global.stop_sound);	
}

function file_read_all(fname){
	var file = file_text_open_read(fname);
	var content = "";

	while !file_text_eof(file)
	{
	    content += file_text_read_string(file);
	    file_text_readln(file);
	}	
	file_text_close(file);
	/*var buffer = buffer_load(working_directory + fname);
	var content = buffer_read(buffer, buffer_text);
	buffer_delete(buffer);*/
	return content;
}

function map_to_string(map){
	var content = "";
	for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k)) {
	  var v = map[? k];
	  content += k+": " + str(v) + "#";
	}
	return content;
}

function check_all_for_var(obj_idx, var_name, value){
  with (obj_idx){
    if (variable_instance_get(id, var_name) == value)
      return true;
  }
  return false;
}

function custom_goto(rm){
	global.goto_room = rm;
}

function is_character_in_room(char){
	return (char.object_index == Player || (char.script_location() == room));
}

function is_string_a_number(text){
	var s = text;
	var n = string_length(string_digits(s));
	return n && n == string_length(s) - (string_char_at(s, 1) == "-") - (string_pos(".", s) != 0);	
}

function downloadFile(fileName, content){
	//show_message(content);
	get_string("lol", content);
	jsAddJs(@"
	var saveObj = "+content+@"
	
	  var element = document.createElement('a');
	  element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(JSON.stringify(saveObj)));
	  element.setAttribute('download', " +chr(34)+fileName+chr(34)+ @");

	  element.style.display = 'none';
	  document.body.appendChild(element);

	  element.click();

	  document.body.removeChild(element);
	");	
}

function background_set_html(bg){
	jsExecute(
		"document.body.style.backgroundImage = " + chr(34) + " url('html5game/"+background+".png')"+ chr(34) +"; " + chr(34) + ");"
	);
}

function get_follower(){
	var follower = noone;
	with (Character){
		if (following) {
			follower = id;
		}
	}
	return follower;
}

#macro c_lred make_color_rgb(255,202,202)

function splash_message(text, bgColor = c_lred, duration = 160){
	SplashMessage.splash_text = text;
	SplashMessage.splash_color = bgColor;
	SplashMessage.splash_time = duration;
	
}