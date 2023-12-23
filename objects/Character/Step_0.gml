if (is_npc)
	exit;

if (!is_pregnant){
	if (micro_womb != noone)
		womb_content = 300;	
	else
		womb_content = 0;
}

//hardcoded
if (!global.settings[? "Christmas"] && weight_next != -1 && weight >= weight_next){
	//weight_next = -1;
	fat_level = 1;
}else if (global.settings[? "Christmas"]){
	fat_level = 0;
}

skew_step();

stomach_content  = stomach_water + stomach_air + stomach_food;
bowels_content  = bowels_water + bowels_air + bowels_food;

if (micro_stomach != noone){
	stomach_content += 300;
}

if (micro_bowels != noone){
	bowels_content += 300;
}

total_content = stomach_content + bowels_content + womb_content;
total_capacity = stomach_capacity + bowels_capacity + womb_capacity;
total_food_water = stomach_food+stomach_water+bowels_food+bowels_water;
encumbered =  (total_food_water/total_capacity > 0.5);

//no divide by 0
stomach_content = max(0.1, stomach_content);
bowels_content = max(0.1, bowels_content);
total_content = max(0.1, total_content);


/////popping
var modifier = character_capacity_modifier(id);
var do_pop = global.settings[? "Belly Burst"] ;
var fraction = stomach_content/(stomach_capacity*modifier);
var fraction2 = bowels_content/(bowels_capacity*modifier);

/*if ( (fraction > 0.9  || fraction2 > 0.9)
	&& do_pop && !popping &&popped <= 0 && !pop_warning
){
	pop_warning = true;
	audio_play_sound(sndBallloonRub, 0, 0);
}else if ( (fraction < 0.9  && fraction2 < 0.9)
	&& pop_warning)
	pop_warning = false;

if ( (fraction >=1  || fraction2 >= 1)){
	if (!popping && popped <= 0){
		if (!is_location()){
			room_goto(global.last_room);
		}else{
			popping = true;
			audio_play_sound(sndBalloonPop,0 ,0);
			global.pop_char = id;
			exelan("msg_pop");
			
		}
	}
}*/

//////
//digest_step(0.01);

/*calories_unabsorbed = 0;
    
for (i = 0; i < instance_number(Item); i++){
    item = instance_find(Item,i);
    if (item.character == id){
        if (item.in_stomach){
            stomach_content += item.volume;
            calories_unabsorbed += item.calories;
        }else{
            bowels_content += item.volume;
        }
    }
}*/

//belly_size = (stomach_content/stomach_capacity)*55
 //   + (bowels_content/bowels_capacity)*55;

var visual_stomach_cap = clamp(stomach_capacity, 0, 4000);
var visual_bowels_cap = clamp(bowels_capacity, 0, 3000);
var visual_womb_cap = clamp(womb_capacity, 0, 3000);

belly_size = (stomach_content/visual_stomach_cap)*50
    + (bowels_content/visual_bowels_cap)*50
	+ (womb_content/visual_womb_cap)*50;
	
belly_size *= (visual_stomach_cap + visual_bowels_cap)/final_capacity;

//clip to 100%
belly_size = min(100, belly_size);

 var spr_name = "spr" + object_get_name(object_index) + "_" + string(fat_level);
 sprite_index = asset_get_index(spr_name);
 belly_index = min((belly_size/100)*image_number, image_number-1);
 
/*if (belly_size > 3)
    belly_size = 3;*/

weight = base_weight + fat_calories/5000;

//reset arrived notice flag on new day
if (!visited){
	arrived_notice = false;	
}

if (arrived_notice && !in_dialogue() && is_location()){
	var msg = "";
	if (visit_location != room){
		msg = " They sent you a text:";
	}
	
	
		
	var gifts = get_visit_gifts();
	if (array_length(gifts) > 0){
		var gift_msg = "They also gifted you: ";
		for (var g=0; g < array_length(gifts); g++){
			gift_msg += gifts[g].name+", ";
			create_item(gifts[g]);
		}
		
		ctb_list(noone, noone, name + " has arrived at your place." + msg,
			cmd_speaker(object_index) + arrive_msg, gift_msg);	
	}else{
		ctb_list(noone, noone, name + " has arrived at your place." + msg,
			cmd_speaker(object_index) + arrive_msg);	
	}
	
	likability += 2;
	splash_message("Likability +2", c_lime);
	arrived_notice = false;
}

//FIX: DISABLED VOMITING
/*if (!in_dialogue() && (stomach_food+stomach_water) > stomach_capacity*1.1*character_capacity_modifier(id) && is_location()){
	sndVomit = get_random_asset("sndVomit", 1, 5);
	if (global.settings[? "vomit sound"])
		audio_play_sound(sndVomit, 0, 0);
	
	//Player.stomach_content -= min(Player.stomach_capacity/5,Player.stomach_content);
	stomach_air *= 0.5;
	stomach_water *= 0.5;
	stomach_food *= 0.5;
	stomach_pressure *=0.5;
}*/

if (!in_dialogue() && (bowels_food+bowels_water) > bowels_capacity*1.1*character_capacity_modifier(id) && is_location()){
	//sndVomit = get_random_asset("sndVomit", 1, 5);
	audio_play_sound(sndFlush, 0, 0);
	if (object_index == Player){
		time_forward_minutes(15);
		ctb_msg("You ran to the bathroom and returned.");
	}else{
		ctb_msg(name + " clutched her stomach and ran away to the nearest bathroom in a hurry!");
		in_bathroom = 15;
		refresh_location();
	}
	//Player.stomach_content -= min(Player.stomach_capacity/5,Player.stomach_content);
	bowels_air *= 0.5;
	bowels_water *= 0.5;
	bowels_food *= 0.5;
	bowels_pressure *=0.5;
}

if (visiting && visit_minutes <= 0 && !in_dialogue() && (is_location() || ControlEnv.hours >= 22)){
				//visiting = false;
					global.dialogue_char = id;
					var msgText = "";
				  if (!following){
						msgText =  "You received a text from " + name + ": ";
					}
					
					ctb_list(noone, noone,msgText +  choose(
						"I'm going home now. It was nice hanging out with you!",
						"Looks like I have to go, I'll see you later!",
						"Ah, time flies so quickly, I have to return now. It was fun!"
					));
				character_finish_visit(id);
				time_forward_minutes(1);
				//following = false;
				
	}
	
if (using_vibrator){
	skew_xoffset += random_range(-0.5,0.5)
	expression = ex_blush;
}