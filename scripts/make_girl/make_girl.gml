/// @description make_girl(template)
/// @param template
function make_girl(argument0) {
	var template = argument0;
	var girl = instance_create(-100, -100, Girl);
	girl.name = object_get_name(argument0.object_index);
	girl.sprite_index = template.sprite_index;
	girl.face = template.face;
	girl.spec = template.spec;
	girl.wp_type = template.wp_type;
	girl.m_welcome =template.m_welcome;
	girl.m_level_up =template.m_level_up;

	girl.resist_plant = template.resist_plant;
	girl.resist_freeze = template.resist_freeze;
	girl.resist_spicy = template.resist_spicy;

	girl.mouth_x = template.mouth_x;
	girl.mouth_y = template.mouth_y;
	girl.back_x = template.back_x;
	girl.back_y = template.back_y;
	girl.belly_x = template.belly_x;
	girl.belly_y = template.belly_y;
	girl.belly_radius = template.belly_radius;

	attack_attr_move(template, girl);
	return girl;



}
