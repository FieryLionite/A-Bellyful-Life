  ///push_food(item)
function push_food(argument0) {
	var item = argument0;
	var character = global.dialogue_char;
	if (item.in_stomach){
	    item.hours_left = item.volume/100;
	    //character.stomach_content += item.volume;
	    //character.calories += item.calories;
    
	}else{
	    //character.bowels_content += item.volume;
	    item.hours_left = 2;
	}
	say_bubble(character, choose("Huh?", "??", "Hmm?"));



}
