xx = x;
yy = y;
max_height = 0;
for (i = 0; i < instance_number(Item); i ++){

    item = instance_find(Item, i);
    if (!item.is_template || !item.sellable){
        continue;
    }
    
    width = item.sprite_width + 10;
    
    if (xx + width > room_width - ControlBackpack.x - 100){
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

