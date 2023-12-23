function character_drink_kitchensink(){
	with (Character){
		if (following || schedule_get_location(id) == room){
			global.dialogue_char = id;
			var script = asset_get_index(name + "_drink_kitchensink");
			
			if (room == rmBathroomResort)
				script = asset_get_index(name + "_drink_resortsink");
				
			if (script > -1 && desire_inflate + likability >= 10){
				global.scene_script = script;
				
				var msg = name + " eagerly agreed.";
				if (desire_inflate < 10){
					likability -= 1;
					msg = name + " doesn't seem very interested, but still agreed reluctantly (likability -1).";
				}
				
				ctb_list(scene_start, noone, "[speaker:noone]You asked "+name+" to drink from the sink",
					msg);
			}else{
				ctb_list(noone, noone, "Thank you but I'm not thristy.");
				if (script > -1){
					splash_message("Failed inflate desire + likability check ( >= 10)");	
				}
			}
		}
			
	}
	
}