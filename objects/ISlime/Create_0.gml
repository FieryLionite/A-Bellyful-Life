event_inherited();
volume = 300;
price = 0.5;

sfx = CRUNCHY;


sprite_index = choose(
	sprSlime_blue, sprSlime_green, sprSlime_red
)

image_speed = 0.5;
script_use_on_char = d_give_slime;
is_tool = true;
consumable = false;
do_expire = false;
script_use = function(){
	if (instance_exists(ItemWindow)){
		var slime = instance_create_depth(0,0, 0, Slime);
		slime.item = ItemWindow.item;
	}
	
	//with (ItemWindow) instance_destroy();
};

desc = "Give this slime to Bobbie for $$";
alarm[1] = 1;