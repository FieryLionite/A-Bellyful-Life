function Amber_garden(){
	global.show_follower = false;
	global.allow_stream = true;
	global.scene_name = "Garden";
	global.scene_inflate_rate = 2;
	scene_add_actors(Amber, ANAL, WATER);
	scene_auto_sound(ANAL, WATER);
	background_set(sprGreenhouseScene);
	global.scene_do_breath = true;
	global.scene_sound_action = list_create(sndFlowWater);
	with (Amber) skew_common();
}

function Amber_ask_garden(){
	if(Yumi.desire_inflate + Yumi.likability >= 60){
		var msg = "Amber eagerly agreed.";
		
		if (Yumi.desire_inflate < 15){
			msg = "Amber doesn't seem very interested, but still agreed reluctantly (likability -1).";
			Yumi.likability -= 1;
		}
		
		global.scene_script = Amber_garden;	
		ctb_list(scene_start, noone, msg);
	}else{
		splash_message("Failed inflate desire + likability check (must total >= 60)");
		ctb_msg(
			"[ex:blush][speaker:Amber]Ehh? (She tilted her head in confusion at your request)",
			"[ex:idle][speaker:noone]You noticed a hint of hesitation in her expression. Maybe she might agreed if you get closer?"
		);
	}
}