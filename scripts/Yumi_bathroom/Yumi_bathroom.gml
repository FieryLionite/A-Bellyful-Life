function Yumi_bathtub(){
	global.show_follower = false;
	global.allow_stream = true;
	global.scene_name = "Tub";
	global.scene_inflate_rate = 2;
	scene_add_actors(Yumi, ANAL, WATER);
	scene_auto_sound(ANAL, WATER);
	background_set(sprBathtubHose);
	global.scene_do_breath = true;
	global.scene_sound_action = list_create(sndFlowWater);
	with (Yumi) skew_common();
}

function Yumi_ask_bathtub(){
	if(Yumi.desire_inflate + Yumi.likability >= 20){
		var msg = "Yumi eagerly agreed.";
		
		if (Yumi.desire_inflate < 15){
			msg = "Yumi doesn't seem very interested, but still agreed reluctantly (likability -1).";
			Yumi.likability -= 1;
		}
		
		global.scene_script = Yumi_bathtub;	
		ctb_list(scene_start, noone, msg);
	}else{
		splash_message("Failed likability check (>= 20)");
		ctb_msg(
			"[speaker:Yumi]I know that you love to inflate yourself, but don't expect me to be the same.",
			"[speaker:noone]You noticed a hint of hesitation in her voice. Maybe she might agreed if you get closer?"
		);
	}
}