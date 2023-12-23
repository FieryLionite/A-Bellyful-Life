function tooltip_start(x,y, title, text){
	if (instance_exists(Tooltip))
		return noone;
	
	var t = instance_create_depth(x,y, -1000, Tooltip);
	t.title = title;
	t.text = text;
	return t;
}