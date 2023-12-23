function d_resort(){
	if (ControlEnv.go_resort){
		ctb_list(noone, noone, "You are already booked for tommorrow! ");
		return;
	}
	
	exelan("msg_Resort_desc");
}

function d_ask_resort(){
	var days = get_integer("How many days would you like to sign up? ($50 per day per person, 0 to cancel)", 1);
	if (days == 0 || is_undefined(days) || is_nan(days))
		return;
	global.resort_days = days;
	dialogue_init();
	dialogue_create(
	"1",
	"Register yourself ($" +str(days*50) + ")",
	true,
	function(){
		resort_register(global.resort_days*50, list_create());
	}
	)
	
	dialogue_create(
	"2",
	"Also invite Aria ($" +str(days*50*2) + ")",
	true,
	function(){
		resort_register(global.resort_days*50*2, list_create(Aria));
	}
	)
	
	dialogue_start(true);
}

function resort_register(cost, chars){
	if (cost > ControlEnv.money){
		ctb_list(noone, noone, "Insufficient Funds");	
		return;
	}
	ControlEnv.resort_days = global.resort_days;
	ControlEnv.money -= cost;
	ControlEnv.go_resort = true;
	ctb_list(noone, noone, "you booked a room at the resort and will be departing early tommorrow morning. Please pack your luggage by tonight.");
	for (var i=0; i<ds_list_size(chars); i++){
		var c = chars[| i];
		//if (c.likability < 10){
		if (c.likability < 0){
			ctb_append("You texted to invite "+c.name+ " but they decline. Maybe you should get to know them more?");
			continue;	
		}
		ctb_append("You texted to invite "+c.name + " and they happily agreed.");
		c.go_resort = true;
	}
		
	ds_list_destroy(chars);
}

////////
function msg_Resort_desc_EN(){
		ctb_list(d_ask_resort, noone, "It's never a better time to enjoy your dream vacation at our new super luxurious beach resort!",
			"To celebrate our opening we have reduced our entry price to only $50 per day! Sign up now while openings last.");
}

/*function d_player_beach(){
	global.scene_script = scene_beach;
	scene_start();
}

function scene_beach(){
	global.scene_name = "Beach";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	scene_add_actors(Player, noone, noone);
	background_set(sprBeachZoomed);
	
	if (Aria.go_resort){
		scene_add_actors(Aria, noone, noone);
	}
}*/