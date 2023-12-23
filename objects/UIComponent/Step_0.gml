//if not persistent it means the component is temporary and must always be visible
if (persistent)
	UI_hide();
	
if (object_index != ButtonBackpack &&
	object_index != PlayerHolder && 
	room == rmStartOutside)
	x = -1000;

