target_room = rmBedroomDEB;
color = make_color_rgb(255, 133, 251);

if (!DEB.has_number){
	target_room = noone;
	target_script = function(){
		ctb_msg("This is an unused guess room.");
	}
}