if (ControlEnv.screen_lock || instance_exists(Tooltip) 
|| instance_position(mouse_x, mouse_y, btArrowNavi)
|| instance_position(mouse_x, mouse_y, PlayerHolder)
|| instance_position(mouse_x, mouse_y, CharacterHolder))
    exit;

if (target_script != noone){
    target_script();
}

if (target_room != noone){
	custom_goto(target_room);
    /*if (!transition)
        custom_goto(target_room);
    else
        custom_goto(target_room);*/
}