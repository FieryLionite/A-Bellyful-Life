/// @description attack_attr_move(entity1, entity2)
/// @param entity1
/// @param  entity2
function attack_attr_move(argument0, argument1) {
	var entity1 = argument0,
	    entity2 = argument1;
    

	entity2.sp_max = entity1.sp_max;
	entity2.sp = entity2.sp_max;

	entity2.atk_damage = entity1.atk_damage;
	entity2.atk_rate = entity1.atk_rate;
	entity2.def = entity1.def;
	entity2.atk_rate_mult = 1;
	entity2.atk_counter = 0;
	entity2.shake_counter = 0;
	entity2.shaking = false;
	entity2.target = noone;
	entity2.xx = 0;
	entity2.yy = 0;




}
