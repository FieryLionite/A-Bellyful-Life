/// @description effect_stat(x, y, type, value)
/// @param x
/// @param  y
/// @param  type
/// @param  value
function effect_stat(argument0, argument1, argument2, argument3) {
	var stat = instance_create(argument0, argument1, EffectStat);
	stat.image_index = argument2;
	stat.value = argument3;



}
