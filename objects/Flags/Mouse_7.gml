dialogue_init()
	
		dialogue_create(
		        "1",
		        "English",
		        true,
		        function(){global.language = EN; room_restart();}
		)
	
		dialogue_create(
			        "4",
			        "中文",
			        true,
			       function(){global.language = CN;room_restart();}
		)
		
		dialogue_create(
			        "2",
			        "日本 ",
			        true,
			       function(){global.language = JP;room_restart();}
		)
	
		dialogue_create(
			        "3",
			        "русский",
			        true,
			       function(){global.language = RUS;room_restart();}
		)
		
		

	dialogue_start(true);