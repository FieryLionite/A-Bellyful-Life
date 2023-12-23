/// @description  scale_canvas(base width, base height, current width, current height, center);
/// @param base width
/// @param  base height
/// @param  current width
/// @param  current height
/// @param  center
/*function scale_canvas(argument0, argument1, argument2, argument3, argument4) {
	//argument0 = base width;
	//argument1 = base height;
	//argument2 = current width
	//argument3 = current height
	//argument4 = center window (true, false);

	var aspect = (argument0 / argument1);

	if ((argument2 / aspect) > argument3)
	    {
	    window_set_size((argument3 * aspect), argument3);
	    }
	else
	    {
	    window_set_size(argument2, (argument2 / aspect));
	    }

	if (argument4) window_center();

	surface_resize(application_surface, min(window_get_width(), argument0), min(window_get_height(), argument1));



}*/

/// @description  scale_canvas(base width, base height, current width, current height, center);
/// @param base width
/// @param  base height
/// @param  current width
/// @param  current height
/// @param  center
function scale_canvas(argument0, argument1, argument2, argument3, argument4) {
	//argument0 = base width;
	//argument1 = base height;
	//argument2 = current width
	//argument3 = current height
	//argument4 = center window (true, false);

	var aspect = (argument0 / argument1);

	if ((argument2 / aspect) > argument3)
	    {
	    window_set_size((argument3 * aspect), argument3);
	    }
	else
	    {
	    window_set_size(argument2, (argument2 / aspect));
	    }

	if (argument4) window_center();

	surface_resize(application_surface, argument0, argument1);//min(window_get_width(), argument0), min(window_get_height(), argument1));



}

