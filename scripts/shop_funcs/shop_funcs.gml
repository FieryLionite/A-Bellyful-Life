///set_shop(BG, item1, item2, ...)
function init_shop(bg){
	target_room = rmShop;
	is_shop = true;
	items = ds_list_create();
	for (var i=1;i < argument_count; i++){
		ds_list_add(items, argument[i]);
	}
	shop_bg = bg;
}

function shop_start(){
	background_set(global.shop_bg);
	
	xx = 75;
	yy = 20;
	max_height = 0;
	var items = global.shop_items;
	for (i = 0; i < ds_list_size(items); i ++){

	    item = items[| i];
	    if (!item.is_template || !item.sellable){
	        continue;
	    }
    
	    width = item.sprite_width + 10;
    
	    if (xx + width >  ControlBackpack.x - 25 || item.object_index == INextLine){
	        xx = 75;
	        yy += max_height + 5;
	        max_height = 0;
			if ( item.object_index == INextLine)
				continue;
	    }
	    height = item.sprite_height + 10;
	    if (height > max_height)
	        max_height = height;
			
	    card = instance_create(xx,yy, ItemCard);
	    card.item = item;
	    xx += width + 5;
	}
}