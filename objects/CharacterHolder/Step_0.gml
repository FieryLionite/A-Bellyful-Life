if (!enabled || room == rmDialogue || !StickerEye.image_index){
    visible = false;
    mask_index = sprBlank;
}else{
    visible = true;
    mask_index = sprite_index;
}

if (x < 0)
    x = random(5);
if (x > room_width - 550)
    x = room_width - 550;
    
/*
if ((x == xprevious && y == yprevious) &&
    (!place_meeting(x,y,CharacterHolder) || move_counter <= 0))
    visible = true;
else
    visible = false;*/

/* */
/*  */
if (instance_exists(ItemCard) && !place_meeting(x,y,ItemCard)){
		image_alpha = 0.5;
}else
	image_alpha = 1;
	
if (!enabled && !in_dialogue())
	enabled = true;