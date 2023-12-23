var card = instance_place(x, y, ItemCard);
if (card != noone && card.item.object_index == IHouseKeys){
	with (card.item) instance_destroy();
	with (card) instance_destroy();
	audio_play_sound(sndDoorUnlock, 0, 0);
	room_goto(rmBedroom);
}