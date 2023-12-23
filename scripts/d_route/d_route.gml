function d_route(dest){
	if (global.last_dest == dest && dest != rmShop) ||
		(dest == rmShop && global.clicked_shop_bt!= noone&& global.shop_bg == global.clicked_shop_bt.shop_bg){
			//show_message(sprite_get_name( global.shop_bg))
			
		/*f (dest == rmMapUni)
			global.last_dest = rmMapShopping;
		else if (dest = rmMapShopping)
			global.last_dest = rmMapUni;*/
			
		if(is_map_room(dest))
			global.last_dest = room;
			
		custom_goto(dest);
		return;
	}
	global.dest = dest;
	 prev_x = -1 ;
	 prev_y = -1;
	 dest_x = -1;
	 dest_y = -1;
	 
	if (dest != rmShop){
		with (btMapNavi){
			if (instance_position(mouse_x, mouse_y, id)){
				other.dest_x = x;
				other.dest_y = y;
			}
			
			if (target_room == global.last_dest){
				other.prev_x = x;
				other.prev_y = y;
			}/*else if (target_room == global.dest){
				other.dest_x = x;
				other.dest_y = y;
			}*/
		}
	}else{
		with (btMapNavi){
			if (shop_bg ==  global.shop_bg){
				other.prev_x = x;
				other.prev_y = y;
			}/*else if ( global.clicked_shop_bt == id){
				other.dest_x = x;
				other.dest_y = y;
			}*/
		}
	}
	
//	if (prev_x == -1 || prev_y == -1 || dest_x == -1 || dest_y == -1)
	//	show_message("error");
	
	var dist = point_distance(prev_x, prev_y, dest_x, dest_y);
	global.has_umbrella = false;
	with (IUmbrella){
		if (!is_template)
			global.has_umbrella = true;
	}
	if (ControlEnv.raining > 0)
		if (!global.has_umbrella)
			dist *= 2;
		else
			dist *= 1.5;
			
	var walk_time = ceil((dist/100)*1.5),
		bike_time = walk_time*0.5,
		taxi_time = ceil(walk_time*0.1),
		taxi_cost = ceil(dist/100),
		walk_energy = 0,
		bike_energy = 0;
		
	if (Player.encumbered){
		walk_energy = -floor(dist/200);
		bike_energy = floor(walk_energy/2);
	}
	
	global.route_dist = dist;
	global.walk_energy = walk_energy;
	global.bike_energy = bike_energy;
	
	dialogue_init();
	
	var walk = strlan(EN, "Walk", RUS, "Ходить", JP, "歩く", CN, "走");
	var energy = str_energy;
	var mins = str_mins;
	dialogue_create(
	        "1",
	        walk+" (" + string(walk_time)+ " " + mins + ", "+ string(walk_energy) + " " + energy + ")",
	        true,
	        d_walk
	)
	
	var bike = strlan(EN, "Bike", RUS, "велосипед", JP, "自転車", CN, "自行车");
	if (ControlEnv.has_bike)
		dialogue_create(
		        "2",
		        bike+" (" + string(bike_time)+ " " + mins + ", "+ string(walk_energy)+ " " + energy + ")",
		        true,
		        d_bike
		)
		
	var taxi = strlan(EN, "Taxi", RUS, "Такси", JP, "タクシー ", CN, "出租车");
	dialogue_create(
	        "3",
	        taxi+" (" + string(taxi_time)+ " " + mins + ", "+string(taxi_cost)+"$)",
	        true,
	        d_taxi
	)
	
	dialogue_start(true);
	//show_message(string(point_distance(prev_x, prev_y, dest_x, dest_y)));
	//global.temp = dest;
}

function d_walk(){
	var time = ceil((global.route_dist/100)*1.5);
	if (!change_energy(Player, global.walk_energy, false)){
		ctb_list(noone, noone, "Not enough energy!");
		return;
	}
	
	time_forward_minutes(time);
	route_go();
}

function d_bike(){
	var time = ceil((global.route_dist/100)*1.5)/2;
	if (!change_energy(Player, global.bike_energy, false)){
		ctb_list(noone, noone, "Not enough energy!");
		return;
	}
	time_forward_minutes(time);
	route_go()
}

function d_taxi(){
	var time = ceil((global.route_dist/100)*1.5/10),
		cost = ceil(global.route_dist/100);
	ControlEnv.money -= cost;
	time_forward_minutes(time);
	route_go();
}

function route_go(){
	var dest =  global.dest;
	if (dest == rmMapShopping && !Bobbie.met_player){
			global.last_dest = rmAlley;
			custom_goto(rmAlley);
			return;
	}
	
	global.last_dest =dest;
	/*if (dest == rmMapUni)
		global.last_dest = rmMapShopping;
	else if (dest = rmMapShopping)
		global.last_dest = rmMapUni;*/
	if (is_map_room(dest))
		global.last_dest = room;

	if (dest == rmShop){
		var bt = global.clicked_shop_bt;
		global.shop_bg = bt.shop_bg;
		global.shop_items = bt.items;	
		global.last_room = room;
	}else{
		global.clicked_shop_bt = noone;	
		global.shop_bg = noone;
	}
	custom_goto(dest);	
}