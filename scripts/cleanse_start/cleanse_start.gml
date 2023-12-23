function cleanse_start() {
	if (instance_exists(Card.girl)){
	    global.cleanse_girl = Card.girl;
	    gate_goto(rmCleanse);
	}



}
