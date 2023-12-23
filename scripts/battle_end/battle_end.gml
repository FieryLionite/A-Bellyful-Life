function battle_end() {
	for (var i = 0; i < instance_number(Girl); i ++){
	    var girl = instance_find(Girl, i);
	    girl.spicy = 0;
	    girl.freeze = 0;
    
	    if (girl.stomach > 0){
	        with (girl) consume(stomach);
	        girl.stomach = 0;
	    }
	}



}
