function eat_sound(item){
	switch(item.sfx){
		case CRUNCHY:
			audio_play_sound(choose(chewcrunch1, chewcrunch2, chewcrunch3, chewcrunch4),0,0);
		break;
		case CHEWY:
			audio_play_sound(choose(chewsoft1, chewsoft2, chewsoft3, chewsoft4, chewsoft5),0,0);
		break;
		case LIQUID:
			audio_play_sound(choose(swallow1, swallow2, swallow3, swallow4),0,0);
		break;
	}
}