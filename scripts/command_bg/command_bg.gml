function command_bg(argument0) {
	if (!is_numeric(argument0))
		argument0 = asset_get_index(argument0);
	
	var index = argument0;
	__background_set( e__BG.Index, 0, index );



}
