/// @description effect_weapon(sprite, target, source, distance)
/// @param sprite
/// @param  target
/// @param  source
/// @param  distance
function effect_weapon(argument0, argument1, argument2, argument3) {
	var effect = instance_create(argument1.xcenter, argument1.ycenter, EffectWeapon),
	    dir = point_direction(argument2.xcenter, argument2.ycenter, argument1.xcenter, argument1.ycenter);
	effect.x += lengthdir_x(argument3, dir);
	effect.y += lengthdir_y(argument3, dir);
	effect.sprite_index = argument0;
	effect.image_angle = dir;




}
