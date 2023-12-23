sprite_index = sprPosterOutline;
//target_room = rmCharger;
target_script = function(){
	dialogue_init()
	dialogue_create(
	        "1",
	        "Visit Project Quimbly!",
	        true,
	        function(){
				url_open_ext("https://teamquimbly.itch.io/pjquimbly","_blank");
			}
	)
	
	dialogue_start(true);
		
}

x = 0;
y = 0;