function tutorial_switch() {
	var sprite = noone;
	switch (room){
	    case rmMainMenu:
	        sprite = sprTutorialMain;
	    break;
	    case rmForgeUpgrade:
	        sprite = sprTutorialUpgrade;
	    break;
	    case rmBattle:
	        sprite = sprTutorialBattle;
	    break;
    
	    case rmCleanse:
	        sprite = sprTutorialCleanse;
	    break;
    
	    case rmPressure:
	        sprite = sprTutorialPressure;
	    break;
    
	    default:
	        sprite = sprTutorialMission;
	}

	tutorial_set(sprite);



}
