function d_use_wallet(){
	if (!instance_exists(ItemWindow)) //portal lol
		return;
	
	audio_play_sound(sndCoin, 0, 0);
	var money = random_range(10, 50);
	ctb_list(noone, noone, "You found $" + string(money));
	ControlEnv.money += money;
	with (ItemWindow.item) instance_destroy();
}

function d_give_wallet(char){
	if (char.name != Remi.name){
		ctb_list(noone, noone, "Please give this wallet to Remi.");
		return;
	}
	
	with (item) instance_destroy();
	ctb_list(noone, noone, "[speaker:Remi][ex:smile2]You found this on the ground? That's so kind of you to want to return it!",
		"(She seemed visibly excited) I'll make sure that this wallet is returned to it's proper owner. ",
		"[ex:idle][speaker:noone]Remi seemed to be more fond of you.");
	Remi.likability += 5;
	splash_message("Likability +5", c_lime);
}