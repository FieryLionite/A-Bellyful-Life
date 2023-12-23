if (point_distance(mouse_x,mouse_y, xpre+width/2, ypre+height/2) < width/1.5){
    dragging = false;
    win = instance_create(0,0,ItemWindow);
    win.item = item;
    win.card = id;
}

if (item.do_expire and item.expire_in <= 0 and !item.is_tool){
		instance_destroy(item);
		instance_destroy();
}