/// @description card_make(x, y, girl)
/// @param x
/// @param  y
/// @param  girl
function card_make(argument0, argument1, argument2) {
	var girl = argument2;
	var card = instance_create(argument0,argument1, Card);
	card.girl = girl;

	return card;



}
