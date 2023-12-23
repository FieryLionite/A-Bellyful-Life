function change_mood(cid, inc, partial){
	if ((inc > 0 && cid.mood >= 100) ||  (inc < 0 && cid.mood <= 0) ||
		(!partial && (cid.mood + inc > 100 || cid.mood + inc < 0)))
		return -1;
		
	cid.mood += inc;
	if (cid.mood > 100 || cid.mood < 0){
		cid.mood	 = clamp(cid.mood, 0, 100);
		return 0;
	}
	return 1;
}

function change_energy(cid, inc, partial){
	if (inc < 0){
		 if (cid.jittery >  80)
			inc *= 1.3;
		else if (cid.jittery >  50)
			inc *= 1.15
		else if (cid.jittery >  30)
			inc *= 1.08;
	}
	
	if ((inc > 0 && cid.energy >= cid.energy_max) ||  (inc < 0 && cid.energy <= 0) ||
		(!partial && (cid.energy + inc > cid.energy_max || cid.energy + inc < 0)))
		return -1;
		
	cid.energy += inc;
	if (cid.energy > cid.energy_max || cid.energy < 0){
		cid.energy	 = clamp(cid.energy, 0, cid.energy_max);
		return 0;
	}
	return 1;
}

function character_belly_index(cid, sprite){
	var img_number = sprite_get_number(sprite);
	return min((cid.belly_size/100)*img_number, img_number-1);	
}