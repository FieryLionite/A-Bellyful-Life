alarm[10] = 120+ random(120);

if (instance_exists(CharacterHolder)){
    holder = floor(random(instance_number(CharacterHolder)));
    //script_execute(holder.character.script_idle);
}

