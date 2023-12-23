function character_refuse_scene(char = noone){
	if (char == noone){
		char = global.dialogue_char;
	}
	char.likability --;
	quick_scene_begin("Refuse", function(){
			//with(Character) skew_none();
			ctb_msg("Noo! What are you doing?", "(She pulled back in panic from  your actions, likability -1)");
			global.show_follower = false;
		}, [char]);
}