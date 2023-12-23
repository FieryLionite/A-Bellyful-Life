var bg = background_get();
//show_message(bg);

if (os_browser != browser_not_a_browser &&  global.settings[? "Blurr Backgrounds"]){
	var bgName = sprite_get_name(bg);
		set_html_background(bgName);
}