function battle_retreat() {
	if (show_question("Are you sure? You will loose all progress in this battle.")){
	    global.side_won = 2;
	    custom_goto(global.combat_room);
	}



}
