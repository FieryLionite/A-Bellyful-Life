var current_scale = scale_items;
for (var i=ds_list_size(queue)-1; i >=0 ; i--){
	var ivi = instance_create_depth(random(room_width), 
		room_height * 0.6 + random(room_height*0.4), 0, IVItem);
	var sprID = asset_get_index(queue[| i]), color = c_white, scale = current_scale;
	if (sprID == -1){
		sprID = sprSplash;	
		color = queue[| i];
		scale /= 2;
	}
	
	ivi.sprite_index = sprID;
	ivi.scale = scale;
	ivi.color = color;
	current_scale *= 0.8;
}