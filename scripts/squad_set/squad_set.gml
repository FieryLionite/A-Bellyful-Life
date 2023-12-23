/// @description squad_set(num)
/// @param num
function squad_set(argument0) {

	var num = argument0;
	ControlSquad.current_squad = num;

	squad = global.squads[num];
	for (var i = 0; i < instance_number(Card); i ++){
	    var card = instance_find(Card, i);
	    card.girl = squad[? card.squad_pos]; 
	    //show_message(card.squad_pos + ", " + string(card.girl));
	}



}
