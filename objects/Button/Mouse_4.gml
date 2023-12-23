if (global.screen_lock)
    exit;

if (script != noone){
    //script_execute(script);
	script();
}

if (target_room != noone){
    if (!transition)
        custom_goto(target_room);
    else
        custom_goto(target_room);
}

