if (global.abilities[? ability])
    exit;
cost = ability_get_cost(ability);
if (ControlEnv.fat_essences >= cost){
    ControlEnv.fat_essences -= cost;
    global.abilities[? ability] = true;
}

