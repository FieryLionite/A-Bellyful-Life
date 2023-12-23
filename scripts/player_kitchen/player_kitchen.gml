function player_kitchen(){
	global.scene_name = "SinkKitchen";
	background_set(sprKitchenZoomed);
	
	if (global.last_room == rmBathroomResort){
		global.scene_name = "ResortSink";
		background_set(sprBathroomSinkResort);
	}
	
	global.scene_inflate_rate = 2;
	global.allow_stream = true;
	scene_add_actors(Player, ORAL, WATER);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
	with (Player) skew_common();
}

function d_kitchen_sink(){
	global.scene_script = player_kitchen;
	
	dialogue_init();
	dialogue_create(
	"Drink",
	str_drink,
	true,
	scene_start
	)
	
	dialogue_create(
	"Throw up",
	str_throwup,
	true,
	player_throw_up
	)
	
	global.has_bottle = false;
	with(IBottle){
		if (!is_template)
			global.has_bottle = true;
	}
	if (global.has_bottle){
		dialogue_create(
		"Refill Bottle",
		str_refill,
		true,
		refill_bottles
		)	
	}
	
	with (Character){
		if (following || schedule_get_location(id) == room){
			dialogue_create(
			name,
			"Ask " + name + " to drink.",
			true,
			character_drink_kitchensink
			)
		}
	}
	
	dialogue_start(true);
}

function refill_bottles(){
	ctb_msg("You refilled all bottles, including ones in the fridge.")
	with (IBottle){
		if (!is_template){
			var bw = create_item(instance_find(IBottleWater, 0));
			bw.in_fridge = in_fridge;
			instance_destroy();
		}
	}
}