function d_give_slime(char){
	if (char.name != Bobbie.name){
		ctb_list(noone, noone, "Please give this slime to Bobbie.");
		return;
	}
	audio_play_sound(sndCoin, 0, 0);
	ControlEnv.money += item.price;
	with (item) instance_destroy();
	Bobbie.likability += 5;
	splash_message("Likability +5", c_lime);
}