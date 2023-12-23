function d_0101end() {
	__background_set( e__BG.Index, 0, bgBarn );

	//if (!ds_map_exists(global.missions_done, rm_0101)){
	    var girl = make_girl(Rye);
	    global.combat_room = rmMainMenu;
	    global.last_room = rmMainMenu;
	    global.welcome = true;
	    global.info_girl = girl;
	    ctb_list(noone, rmInfo, 
	    "[face:aria]That wasn't hard at all, I'm surprised there were enemies at all actually. Lets contact HQ to bring over the supplies and reinforcements needed to take over the base."
	    )




}
