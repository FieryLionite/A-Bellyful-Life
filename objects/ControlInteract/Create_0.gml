y = room_height - 600;

holder = create_character_holder(global.dialogue_char);
holder.x = x;
holder.y = y;

for (i = 0; i < instance_number(Item); i ++){

    item = instance_find(Item, i);
    if (!item.in_stomach && !item.in_bowels &&
        item.character != global.dialogue_char){
        continue;
    }
    if (item.in_stomach)
        zone = global.zone_stomach;
    else
        zone = global.zone_bowels;
        
    card = instance_create(0,0, ItemCard);
    card.item = item;
    show_message(string(card) + "|" + string(zone));
    card.x = zone.x + random(zone.sprite_width);
    card.y = zone.y + random(zone.sprite_height);
}

