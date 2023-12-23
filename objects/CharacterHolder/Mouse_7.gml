if (!in_dialogue()
	&& ControlEnv.room_counter > 10
	&& !instance_exists(ItemCard) //drop card on holder
	){
    focus_holder(id);
    //script_execute()//character.script_dialogue);
    d_standard();
}

