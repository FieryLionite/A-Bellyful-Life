function load_default() {
	Control.alarm[2] = 1;
	//
	/*
	SaveBuffer = buffer_load("save.dat");
	buffer_seek(SaveBuffer, buffer_seek_start, 0);
	game_load_buffer(SaveBuffer);
	*/
	game_load("save.dat");
	Control.alarm[2] = 1;
	dialogue_ok("Yay!", "Game loaded sucessfully");



}
