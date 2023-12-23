if (SmileySticker.image_index > 2)
	ctb_msg("You're too bored to skip time!");
else{
	time_forward_minutes(10);
	if (Player.mood > 0)
		Player.mood -= 1;
}

