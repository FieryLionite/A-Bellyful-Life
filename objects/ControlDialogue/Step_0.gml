exit;
if (global.dialogue != noone){
    script_execute(global.dialogue);
    global.dialogue = noone;
}

if (global.dialogue_char != noone){
    if (!instance_exists(obj_textbox)&&!instance_exists(dropdown_dialogue)){
        textbox_free_counter++;
        if (textbox_free_counter > 20){
            global.dialogue_char = noone;
            with (CharacterHolder){
                enabled = true;
            }
        }
    }else
        textbox_free_counter = 0;
}else{
    textbox_free_counter = 0;
}

