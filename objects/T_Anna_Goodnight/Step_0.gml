if (ControlEnv.hours != prev_time
    && prev_time < 22 && ControlEnv.hours >= 22
    && !UI_busy()){
    focus_holder(Anna.holder);
    global.dialogue_char = Anna;
    ctb_list(noone, noone, "Good Night " + Player.name + "!");
    trigger_activate();
}

prev_time = ControlEnv.hours;

