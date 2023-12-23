function Bobbie_bathtub(){
	global.show_follower = false;
	global.allow_stream = true;
	global.scene_name = "Tub";
	global.scene_inflate_rate = 2;
	scene_add_actors(Bobbie, ANAL, WATER);
	scene_auto_sound(ANAL, WATER);
	background_set(sprBathtubHose);
	global.scene_do_breath = true;
	global.scene_sound_action = list_create(sndFlowWater);
	with (Bobbie) skew_common();
}

function Bobbie_ask_bathtub(){
	if(Bobbie.desire_inflate + Bobbie.likability >= 70){
		var msg = "Bobbie eagerly agreed.";
		
		if (Bobbie.desire_inflate < 15){
			msg = "Bobbie doesn't seem very interested, but still agreed reluctantly (likability -1).";
			Bobbie.likability -= 1;
		}
		
		global.scene_script = Bobbie_bathtub;	
		ctb_list(scene_start, noone, msg);
	}else{
		splash_message("Failed inflate desire + likability check (must total >= 70)");
		ctb_msg(
			"[ex:blush][speaker:Bobbie]Ehhh, I know we're smoking buds and all, you're asking me to do something really weird.",
			"[ex:idle][speaker:noone]You noticed a hint of hesitation in her voice. Maybe she might agreed if you get closer?"
		);
	}
}