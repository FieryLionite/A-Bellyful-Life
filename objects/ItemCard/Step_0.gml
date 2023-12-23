if (!instance_exists(item)){
	instance_destroy();
	exit;
}

width = item.sprite_width*item.scale + 10;    
height = item.sprite_height*item.scale + 10;
image_xscale = width/100;
image_yscale = height/100;

if (item.is_hidden)
	visible = false;

if (!global.abilities[? "check"] && 
    (item.in_stomach || item.in_bowels)){
    visible = false;
}

if (dragging){
	drag_counter ++;
	if (drag_counter > 40){
		with(ItemCard) image_alpha = 0.5;
		var closest = instance_place(x,y,ItemCard);
		if (instance_exists(closest))
			closest.image_alpha = 1;
		image_alpha = 1;
	}
	
    x = mouse_x - width/2;
    y = mouse_y - height/2;
    
	//move out if in inventory
	if (item.script_use_on_item == noone && room == rmBackpack && point_distance(x,y,xorg, yorg) > 100){
		persistent = true;
		depth = -2;
		custom_goto(global.last_room);
	}
    
}else{
	if (mouse_down){
		var dif = mouse_y-mouse_org_y;
		yorg += dif;
		mouse_org_y = mouse_y;
	}
	
		drag_counter = 0;
    if (!item.in_stomach && !item.in_bowels){
		if (persistent &&  point_distance(x,y,xorg, yorg) <= 100){
			//persistent = false;
			custom_goto(rmBackpack);
			instance_destroy();
		}
		
        dis = point_distance(x,y,xorg, yorg);
        if (dis > 10){
            x += (xorg - x)/10;
            y += (yorg - y)/10;
        }else{
            x = xorg;
            y = yorg;
        }
    }else{
        if (item.in_stomach)
            zone = global.zone_stomach;
        else
            zone = global.zone_bowels;
            
        if (x < zone.x)
            x += 4;
        if (y < zone.y)
            y += 4;
        if (x + width > zone.x + zone.sprite_width)
            x -= 4;
        if (y + height > zone.y + zone.sprite_height)
            y -= 4;
    }
}


//FIX
if (dragging and room == rmMassage and
	point_distance(x,y,ControlMassage.mouth_x, ControlMassage.mouth_y) < 20){
	if (item.script_use != noone){
		if (ControlEnv.counter % 60 == 0){
			if (item.script_use != d_item_consume){
				//item.script_use();
				//do nothing cus only eating is allowed here!
			}else
				item_consume_part(item, global.char_massage);
		}
	}
	
	//if (!item.is_template)
   
	
	if (item.consumable && item.bites <= 0){
		if (item.uses <= 0)
			with (item) instance_destroy();
	}
	
	if (!instance_exists(item))	{
		instance_destroy();
	}
}
