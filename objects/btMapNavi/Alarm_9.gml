npc = noone;
with (Character){
		if (!is_npc and  script_location != scrBlank and script_location() == other.target_room){
			other.npc = id;	
		}
}