if (instance_exists(dropdown_dialogue))
	exit;

global.settings[? name] = !global.settings[? name];

if (script != noone)
	script();