init_data_excludes(
	"character", "zone", 
	"script_use", "script_use_on_item", "script_use_on_char",
	"sfx", "use_items"
)

price = 0;
charging = false;
name = object_get_name(object_index);
name = string_copy(name, 2, string_length(name)-1);
image_speed = 0;
consumable = true;
uses = -1;
bites = 1;

visible = false;
persistent = true;

in_stomach = false;
in_bowels = false;
zone = noone;
character = noone;
is_hidden = false;

is_pill = false;
is_tool = false;
volume = 0;
calories = 0;
energy = 0;
alcohol = 0;
high = 0;
script_use = d_item_consume;
script_use_on_item = noone;
script_use_on_char = item_give_consume;
script_tick = noone;
scale = 1;

is_template = true;
desc = "";
sellable = true;

show_name = false;
show_volume = false;
hours_left = 0;

sfx = noone;

alarm[0] = 1;

do_expire = true;
in_fridge = false;
expire_in = 60*22;

use_items = noone;

no_custom_destroy = false;

liquid_color = noone;