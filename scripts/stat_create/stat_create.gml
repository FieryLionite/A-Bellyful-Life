/// @description stat_create(name, max, start)
/// @param name
/// @param  max
/// @param  start
function stat_create(argument0, argument1, argument2) {
	var name = argument0,
	    val_max = argument1,
	    start = argument2,
	    stats = global.stats;
    
	stats[? name] = start;
	stats[? string(name + "_max")] = val_max;



}
