if (instance_exists(dropdown_dialogue))
	exit;
	
yy = mouse_y - y;
audio_play_sound(pageflip3, 0, 0);
if (yy < 125){
	global.name_async = get_string_async("Please Enter Your Name: ","Ayume");
	
	//audio_sound_gain(bgmA, 1, 60);
}else if(yy < 223){
	custom_goto(rmSaveLoad);
}else if (yy < 322){
	custom_goto(rmSettings);
}else{
	//credits
}