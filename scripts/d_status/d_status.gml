function d_status() {
	audio_play_sound(pageflip3, 0, 0);
	if (room != rmJournal)
		global.last_room = room;
	custom_goto(rmStatus)
}
