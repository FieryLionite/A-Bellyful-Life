function refresh_charger() {
	with(ItemCard) {
		if (x < ControlBackpack.x)
	    //if (!item.in_fridge)//item.character == noone && !item.is_template)
	        instance_destroy();
	}

	xxF = x;
	yyF = y;

	//Tools first!
	max_height = 0;
	for (i = 0; i < instance_number(Item); i ++){

	    item = instance_find(Item, i);
	    if (!item.charging){
	        continue;
	    }
    
	    width = item.sprite_width + 10;
    
	    if (xxF + width > ControlCharger.x  + 450){
	        xxF = x;
	        yyF += max_height + 5;
	        max_height = 0;
	    }
    
	    height = item.sprite_height + 10;
	    if (height > max_height)
	        max_height = height;
	    card = instance_create(xxF,yyF, ItemCard);
	    card.item = item;
	    xxF += width + 5;

    
	}

	for (i = 0; i < instance_number(Item); i ++){
	 if (!item.in_fridge){
	        continue;
	    }

	    item = instance_find(Item, i);
	    if (item.is_tool || item.in_stomach || item.in_bowels || item.is_template){
	        continue;
	    }
    
	    width = item.sprite_width + 10;
    
	    if (xxF + width > ControlFridge.x + 450){
	        xxF = x;
	        yyF += max_height + 5;
	        max_height = 0;
	    }
    
	    height = item.sprite_height + 10;
	    if (height > max_height)
	        max_height = height;
	    card = instance_create(xxF,yyF, ItemCard);
	    card.item = item;
	    xxF += width + 5;

    
	}
}
