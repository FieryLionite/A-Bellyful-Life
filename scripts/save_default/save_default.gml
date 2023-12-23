function save_default() {
	squad_save();
	Control.alarm[2] = 1;
	/*
	SaveBuffer  = buffer_create(1024, buffer_grow, 1);//buffer_create(16384, buffer_fixed, 2);
	buffer_seek(SaveBuffer, buffer_seek_start, 0);
	//
	game_save_buffer(SaveBuffer );
	buffer_save(SaveBuffer , "save.dat");*/

	game_save("save.dat");



}
