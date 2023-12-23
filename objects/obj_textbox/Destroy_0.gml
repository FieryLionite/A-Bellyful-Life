if (destroyed)
	exit; //WTF
destroyed = true;
if (finish_script != noone){
	//if (finish_script == aya_choice)
		//show_message("here2_" + str(id))
    //script_execute(finish_script);
	finish_script();
}
    
if (finish_room != noone)
    custom_goto(finish_room);

sprite_delete(sprite_index);