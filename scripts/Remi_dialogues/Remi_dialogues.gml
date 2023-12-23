function Remi_dialogues(){
	dialogue_init()
	dialogue_create(
			    "1",
			    "Let's go patrolling!",
			    false,
				"Not implemented"
		)
	
	eating_out_ask(Remi);
	
	dialogue_start(true);
}

function Remi_drink_kitchensink(){
	global.allow_stream = true;
	global.scene_name = "Drink";
	global.scene_inflate_rate = 2;
	scene_add_actors(Remi, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
	//ctb_list(noone, noone , "stufffff");
}

function Remi_ask_bathtub(){
	if( Remi.desire_inflate +  Remi.likability >= 80){
		var msg = " Remi eagerly agreed.";
		
		if ( Remi.desire_inflate < 15){
			msg = " Remi doesn't seem very interested, but still agreed reluctantly (likability -1).";
			Remi.likability -= 1;
		}
		
		global.scene_script =  Remi_bathtub;	
		ctb_list(scene_start, noone, msg);
	}else{
		splash_message("Failed inflate desire + likability check (must total >= 80)");
		ctb_msg(
			"[ex:blush][speaker:Remi]WHAT are you asking me to do???",
			"[ex:idle][speaker:noone]You noticed a hint of hesitation in her voice. Maybe she might agreed if you get closer?"
		);
	}
}

function Remi_bathtub(){
	global.scene_name = "Bathtub";
	background_set(sprBathtubHose);
	
	if (global.last_room == rmBathroomResort){
		global.scene_name = "ResortTub";	
		background_set(sprBathtubResort);
	}
	
	global.scene_inflate_rate = 2;
	global.allow_stream = true;
	scene_add_actors(Remi, ANAL, WATER);
	scene_auto_sound(ANAL, WATER);

	global.scene_do_breath = true;
	global.scene_sound_action = list_create(sndFlowWater);
	with (Remi) skew_common();
	
	//repulsed_message();
}