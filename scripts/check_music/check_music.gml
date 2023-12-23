function check_music() {
	var patient = global.patient;
	var msg = "true";

	if (patient.music == genre_classical){
	    if (!audio_is_playing(music_classical))
	        msg = "classical";
	}

	if (patient.music == genre_trance){
	    if (!audio_is_playing(music_trance))
	        msg = "trance";
    
	}

	if (patient.music == genre_lowfi){
	    if (!audio_is_playing(music_lowfi))
	        msg = "lowfi";
    
	}

	return msg;




}
