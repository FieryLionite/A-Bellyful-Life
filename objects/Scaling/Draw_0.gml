//draw_sprite(sprLoadingSticker, 0, room_width/2, room_height*0.75);
if (os_browser == browser_not_a_browser){
	if (global.settings[? "Fullscreen"] && !window_get_fullscreen()){
		window_set_fullscreen(true);
	}
	if (!global.settings[? "Fullscreen"] && window_get_fullscreen()){
		window_set_fullscreen(false);
		window_set_size(1280,720);
	}
}

if (global.goto_room != noone){	
	draw_sprite(sprLoadingSticker, 0, room_width/2, room_height*0.75);
	//show_message("here");
	if (load_counter < 3){
		load_counter++;	
		exit;
	}
	room_goto(global.goto_room);
	global.goto_room = noone;
	load_counter=0;
}

if (instance_exists(ControlEnv)){
	if ControlEnv.blur > 0 //only apply shader if the enabled = 1
	{
		ControlEnv.blur --;
	    shader_set(shaderBlur)
	    shader_set_uniform_f(ControlEnv.usize,512,512,8)//width,height,radius
	}else// if blur == 0
		shader_reset()
}