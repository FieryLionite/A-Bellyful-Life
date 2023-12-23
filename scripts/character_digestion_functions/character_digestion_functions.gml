function ingest(target,entrance, type, amount){
	var content, capacity, side, vname;
	switch(entrance){
		case ORAL:
			side = "stomach";
		break;
		case ANAL:
			side = "bowels";
		break;
	}
	
	
	content = variable_instance_get(target, side + "_content");
	capacity = variable_instance_get(target, side + "_capacity");
	
	var modifier = character_capacity_modifier(target);
	if (content >= capacity*modifier)
		return false;
	
	if (type != BOTH){
		switch(type){
			case WATER:
				vname = "water";
			break;
			case AIR:
				vname = "air";
			break;
			case FOOD:
				vname = "food";
			break;
		}
		vname = side  + "_"+vname;
		variable_instance_set(target, vname, variable_instance_get(target, vname)+amount);
	
		//calculate pressure increase
		var pressure_inc = (amount/capacity)*1.6*100;//double percentage of capacity
		vname = side + "_" + "pressure";
		variable_instance_set(target, vname, variable_instance_get(target, vname)+pressure_inc);
	}else{
		vname = "water";
		for (var tt=0; tt < 2; tt++){
			if (tt == 1)
				vname = "air";
				
			vname = side  + "_"+vname;
			variable_instance_set(target, vname, variable_instance_get(target, vname)+amount);
	
			//calculate pressure increase
			var pressure_inc = (amount/capacity)*1.6*100;//double percentage of capacity
			vname = side + "_" + "pressure";
			variable_instance_set(target, vname, variable_instance_get(target, vname)+pressure_inc);	
		}
	}
	
	change_mood(target, 0.1, true);
	if (content + amount > capacity*modifier)
		return 2;
	return 1;
		
}

function pressure_step(minutes){
	//lol TODO FIX
	for (var i=0; i < minutes; i++){
		if (stomach_pressure > (stomach_content/stomach_capacity)*75)
			stomach_pressure *= 0.97;	
		if (bowels_pressure > (bowels_content/bowels_capacity)*75)
			bowels_pressure *= 0.97;
	}
}

function digest_step(minutes){
	if (using_mpump){
		//ingest(id,ANAL, AIR, minutes*20);
		global.mpump_target = object_get_name(object_index);
		global.mpump_mins = minutes;
		global.mpump = noone;
		with (IMiniPump){
			if (target == global.mpump_target){
				if (batteries > 0)
					batteries -= global.mpump_mins;
				global.mpump = id;
			}
		}
		if (global.mpump.batteries > 0 &&bowels_content < bowels_capacity){
			bowels_air += minutes*15;
			bowels_content += minutes*15;
				/*using_mpump = false;
				global.mpump.target = "";
				global.mpump.is_hidden = false;*/
		}
		
	}
	
	if ((stomach_content < stomach_capacity * 0.95*character_capacity_modifier(id))
		|| (bowels_content < bowels_capacity * 0.95*character_capacity_modifier(id))){
	if (jittery > 0)
		jittery -= min(minutes/12, jittery);
	if (alcohol > 0)
		alcohol -= min(minutes/12, alcohol);
	if (high > 0)
		high -= min(minutes/12, high);
	if (massaged > 0)
		massaged -= min(minutes/12, massaged);
}
		
	var noise = statuses_count[? "pill_noise"];
	if (noise > 0){
		pill_notify("pill_noise",d_pill_noise, minutes);
		
		if (random(1) < (noise * minutes)/10){
			play_stomach_sound()	
		}//else
		//	show_message(string(random(1)) + " < " +string(noise * minutes))
	}
	
	var lax = statuses_count[? "pill_laxative"];
	if (lax > 0 && !in_dialogue() && is_location()){
		if (random(1) < (lax * minutes)/30){
			ds_list_clear(statuses[? "pill_laxative"]);
			audio_play_sound(sndFlush, 0,0);
			change_mood(id, -20, 1);
			change_energy(id, -30, 1);
			ctb_list(noone, noone, "Unable to hold it in any longer, "+name+" ran to the nearest bathroom.");
			in_bathroom = 15;
			refresh_location();
			if (object_index == Player)
				time_forward_minutes(15);
		}else{
			play_stomach_sound();
			if (!in_dialogue() && object_index == Player)
				ctb_list(noone, noone, "Your stomach aches terribly.");
		}
	}
	
	var modifier = 1;
	
	var pdigest = statuses_count[? "pill_digest"],
		pdiet = statuses_count[? "pill_diet"];
		
	modifier += power(1.5, pdigest) + power(0.5, pdiet);
	if (modifier < 0)
		show_message(modifier);
		
	if (minutes < 0)
		show_message(minutes);
		
	minutes *= modifier;
	
	daily_minutes += minutes;
	
	if (hunger == 0){
			change_energy(id, minutes/30, true);
	}else if (hunger == 1){
			
	}else if (hunger == 2){
			change_energy(id, -minutes/15, true);
	}
	
	if (stomach_content/stomach_capacity >= 0.9 && stomach_air > 30)
			do_burp();
	
	daily_stomach_content += (stomach_content/stomach_capacity)*minutes;
	amount =( minutes/1600)*stomach_capacity; //complete digestion in 480 minutes
	amount = min(amount, stomach_content);
	
		if(amount > 0){
			//calc weights
			w_water = stomach_water/stomach_content;
			w_air = stomach_air/stomach_content;
			w_food = stomach_food/stomach_content;
	
		    stomach_water -= amount*w_water;
			stomach_air -= amount*w_air;
			//show_message(str(amount) + "*"+str(w_air))
			if (stomach_food > 0){
				var digested_cal = (undigested_calories* amount*w_food)/stomach_food;
				if (is_pregnant){
					womb_content += digested_cal/12;
					//digested_cal*=2;
					stomach_food -= amount*w_food;//twice
					if (womb_capacity < 1500)
						womb_capacity += womb_content*(minutes/20000);
					if (womb_content >= womb_capacity){
						is_pregnant = false;	
						if (object_index == Player){
							ctb_msg("[speaker:noone] You gave birth to a slime! (Birth scene not implemented)");
						}else{
							ctb_msg("[speaker:noone]" + name + " gave birth to a slime! (Birth scene not implemented).",
								"In her confusion, the slime escaped!");
						}
						
						if (object_index == Player or object_index.script_location() == room){
							var slimei = create_item(instance_find(ISlime,0));
							slimei.price = womb_capacity/3;
							slimei.volume = womb_capacity;
							slimei.sprite_index = slime_sprite;
							
							var slime = instance_create_depth(0,0, 0, Slime);
							slime.item = slimei;	
						}
					}
				}
				stomach_food -= amount*w_food;
		
				undigested_calories -= digested_cal;
				daily_calories += digested_cal;
			}
		}
	if (bowels_content/bowels_capacity >= 0.9 && bowels_air > 30 && !plugged)
		do_fart();
		
	daily_bowels_content += (bowels_content/bowels_capacity)*minutes;
		
	amount =( minutes/1600)*bowels_capacity;
	amount = min(amount, bowels_content);
	if(amount > 0){
		//calc weights
		w_water = bowels_water/bowels_content;
		w_air = bowels_air/bowels_content;
		w_food = bowels_food/bowels_content;
	
	    bowels_water -= amount*w_water;
		//disabled air absorbtion for digestion
		//bowels_air -= amount*w_air;
		bowels_food -= amount*w_food;
	}

	var gas = statuses_count[? "pill_gas"];
	if (gas > 0){
		pill_notify("pill_gas", d_pill_gas, minutes);
		stomach_air += minutes * 6;
		bowels_air += minutes * 6;
	}
}

function character_capacity_modifier(target){
		var m = 1;
		if (target.alcohol >= 30){
			m += (clamp(target.alcohol, 0, 100)/100)*0.15;
		}
		if (target.high >= 30){
			m += (clamp(target.high, 0, 50)/50)*0.15;
		}
		if (target.massaged > 0){
			m += (clamp(target.massaged, 0, 100)/100)*0.30;
		}
		
		return m;
}

function get_stomach_content(char){
	return char.stomach_food+char.stomach_water+char.stomach_air;
}

function get_stomach_capacity(char){
	return char.stomach_capacity*character_capacity_modifier(char);
}

function get_bowels_content(char){
	return char.bowels_food+char.bowels_water+char.bowels_air;
}

function get_bowels_capacity(char){
	return char.bowels_capacity*character_capacity_modifier(char);
}