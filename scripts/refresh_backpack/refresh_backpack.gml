function refresh_backpack() {
	with(ItemCard) {
		if (x >= ControlBackpack.x)
	    if (!instance_exists(item) || (item.character == noone && !item.is_template))
	        instance_destroy();
	}

	xx = x;
	yy = y;

	//Tools first!
	max_height = 0;
	for (i = 0; i < instance_number(Item); i ++){

	    item = instance_find(Item, i);
	    if (!item.is_tool || item.is_template || item.in_fridge || item.charging  || item.is_hidden){
	        continue;
	    }
    
	    width = item.sprite_width*item.scale + 10;
    
	    if (xx + width > room_width){
	        xx = x;
	        yy += max_height + 5;
	        max_height = 0;
	    }
    
	    height = item.sprite_height*item.scale + 10;
	    if (height > max_height)
	        max_height = height;
	    card = instance_create(xx,yy, ItemCard);
	    card.item = item;
	    xx += width + 5;

    
	}

	for (i = 0; i < instance_number(Item); i ++){

	    item = instance_find(Item, i);
	    if (item.is_tool || item.in_stomach || item.in_bowels || item.is_template
			|| item.in_fridge  || item.charging || item.is_hidden){
	        continue;
	    }
    
	    width = item.sprite_width + 10;
    
	    if (xx + width > room_width){
	        xx = x;
	        yy += max_height + 5;
	        max_height = 0;
	    }
    
	    height = item.sprite_height + 10;
	    if (height > max_height)
	        max_height = height;
	    card = instance_create(xx,yy, ItemCard);
	    card.item = item;
	    xx += width + 5;

    
	}



}
