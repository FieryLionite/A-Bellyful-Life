if (!instance_exists(item))
	instance_destroy();
	
sprite_index = item.sprite_index;
image_xscale = item.scale;
image_yscale = item.scale;
spd *= item.scale;

item.is_hidden = true;
