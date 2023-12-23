counter = 0;
for (i = 0; i < instance_number(Character); i ++){
    char = instance_find(Character, i);
    if (!char.has_number)
        continue;
    card = instance_create(x,y + counter*64, ContactCard);
    counter ++;
    card.character = char;
}   

