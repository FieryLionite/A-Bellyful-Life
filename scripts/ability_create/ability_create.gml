/// @description ability_create(name, cost)
/// @param name
/// @param  cost
function ability_create(argument0, argument1) {
	var name = argument0,
	    cost = argument1,
	    abilities = global.abilities;
    
	abilities[? name] = false;
	abilities[? string(name + "_cost")] = cost;



}
