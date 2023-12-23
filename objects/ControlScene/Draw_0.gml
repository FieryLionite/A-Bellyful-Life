var actors = global.scene_actors;

if (Player.alcohol > 30){
	if (floor(random((100 - Player.alcohol)*3)) == 0){
		ControlEnv.blur = random_range(Player.alcohol/3, Player.alcohol/2);
	}
}

if (sounds != noone){
	var vol = 1;
	if (!BtPlay.toggled)
		vol = 0;
		
	for (var i=0; i < ds_list_size(sounds); i ++){
		//show_debug_message(audio_get_name(sounds[|i ])+ " " + string(audio_is_playing(sounds[| i])))
		if (audio_is_playing(sounds[| i]))
			audio_sound_gain(sounds[| i], vol*sound_get_volume(sounds[| i]), 0);
		//if (!audio_exists(sounds[| i]))
			//show_message(sounds[| i]);
	}
}

if (global.scene_do_breath && BtPlay.toggled){
	if (floor(random(30*3)) == 0 && !audio_is_playing_all(sndBreathe1,sndBreathe2,sndBreathe3,sndBreathe4,sndBreathe5))
		audio_play_sound(choose(sndBreathe1,sndBreathe2,sndBreathe3,sndBreathe4,sndBreathe5), 0, 0);
}

for (var i=0; i < ds_list_size(global.scene_actors);i+=3){
	var actor_id =actors[| i],
		entrance = actors[| i+1],
		entrance_name =  (entrance == ORAL) ? "stomach" : "bowels",
		type = actors[| i+2];
		if (type != noone && actor_id.id == Player.id && PlayerHolder.char != Player){
			watched_inflate = true;	
		}
		
		if (!variable_struct_exists(surfs, actor_id) || !surface_exists(surfs[$ actor_id])){
			surfs[$ actor_id] = surface_create(room_width, room_height);
		}
		
		//FIX: dont show player if others are here
		if (actor_id.object_index == Player and
			ds_list_size(global.scene_actors) > 3 and
			(global.scene_show_pump || global.scene_show_bag)){
			continue;		
		}
		
		var sprInsert = noone;
		if (global.scene_show_pump){
			sprInsert = 	sprPumpUp;
		}else if (global.scene_show_bag){
			sprInsert = sprEnemaBag;
		}
		
		
		spr_id  = asset_get_index("spr"+object_get_name(actor_id.object_index) + "_" + global.scene_name + "_" + string(actor_id.fat_level));
		if (spr_id == -1)
			spr_id = asset_get_index("spr"+object_get_name(actor_id.object_index) + "_" + global.scene_name + "_" + string(0));
		/*if (keyboard_check(vk_delete)){
			show_message(spr_id);
			show_message(sprite_get_name(spr_id));
		}*/
		//draw_sprite(spr_id, actor_id.belly_index, 0,0);
		
		if (sprInsert != noone){
				var insert_pos = coords_inflate_get(global.scene_name, actor_id.object_index);
				if (insert_pos != noone){
						var insert_x = insert_pos.entry_x +  actor_id.skew_x*(insert_pos.entry_y/720);
						var insert_y = insert_pos.entry_y;
						var insert_scale = insert_pos.scale;
						
						if (global.scene_show_bag)
							draw_sprite_ext(sprEnemaBag, 0, insert_x, insert_y, insert_scale*insert_pos.item_x*-1, insert_scale, 0, c_white, 1);
						if (global.scene_show_pump)
							draw_sprite_ext(sprPumpUp, 0, insert_x, insert_y, insert_scale*insert_pos.item_x*-1, insert_scale, 0, c_white, 1);
				}
		}
		
		var img_idx = character_belly_index(actor_id, spr_id);
		//special case: sprite only has 2 frames, empty and full
		if (sprite_get_number(spr_id) == 2){
			img_idx = (actor_id.belly_size > 15)? 1:0;	
		}
		
		surface_set_target(surfs[$ actor_id]);
		draw_sprite(spr_id, img_idx, 0,0);
		surface_reset_target();
		
		skew_y = 0;
		skew_x = actor_id.skew_x;
		draw_set_color(c_white);
		skew_draw_surface(surfs[$ actor_id], 0, 0);
		draw_set_color(c_black);
		//draw_surface(surfs[$ actor_id], 0, 0);
		
		//skew_draw_other(actor_id, spr_id, img_idx, 0,0);
		
		
		if (global.scene_interface && StickerEye.image_index){
			draw_sprite(sprGaugeBack, 0, x, y);
		
		if (global.scene_pressure_match){
			 variable_instance_set(actor_id, entrance_name+"_pressure", 
				(variable_instance_get(actor_id, entrance_name+"_content")/variable_instance_get(actor_id, entrance_name+"_capacity"))
				* 115 * global.scene_pressure_match
			 );
		}
		
			var rot = variable_instance_get(actor_id, entrance_name+"_pressure");
			if (rot > 115){
				BtPlay.toggled = false;
				if (entrance == ANAL){
					change_energy(actor_id, -35, 1);
					change_mood(actor_id, -30, 1);
					time_forward_minutes(15);
					character_expel(actor_id);
					var bathroom = noone;
					if (actor_id.object_index == Player){
						if (ButtonMap.last_map == rmMapResort)
							bathroom = rmBathroomResort;
						if (ButtonMap.last_map == rmMapUni)
							bathroom = rmBathroom;
					}
					ctb_list(noone, bathroom, actor_id.name + " couldn't hold it in and was forced to run to the toilet!");
				}else{
					change_energy(actor_id, -35, 1);
					change_mood(actor_id, -30, 1);
					time_forward_minutes(5);
					character_throw_up(actor_id);
					ctb_list(noone, global.last_room, actor_id.name + " couldn't hold it in and was forced to throw up!");
				}
			}
			rot += random_range(-rot*0.1, rot*0.1);
			draw_sprite_ext(sprGaugeDial, 0, x, y, 1, 1, -rot*2, c_white, 1);
		}
		
		if (entrance == noone || !BtPlay.toggled)
			continue;
			
		if (BtPlay.toggled && actor_id.energy <= 1){
			ctb_list(noone, noone, actor_id.name + " is too tired to continue, take a break.");
			BtPlay.toggled = false;
		}
		
		var modifier = character_capacity_modifier(actor_id);
		var do_pop = global.settings[? "Belly Burst"] ;
		var fraction = actor_id.stomach_content/(actor_id.stomach_capacity*modifier);
			
		if (entrance == ORAL){// && actor_id.stomach_content < actor_id.stomach_capacity){
				if (fraction >= 1){
					ctb_list(noone, noone, actor_id.name + "'s stomach is full!");
					BtPlay.toggled = false;
					BtPause.toggled = true;
				}
				//actor_id.stomach_content += global.scene_inflate_rate;
		}
		
		fraction = actor_id.bowels_content /(actor_id.bowels_capacity*modifier);
		if (entrance == ANAL){//&& actor_id.bowels_content < actor_id.bowels_capacity){
				if (fraction >= 1){
					ctb_list(noone, noone,actor_id.name + "'s bowels are full!");
					BtPlay.toggled = false;
					BtPause.toggled = true;
				}
				//actor_id.bowels_content += global.scene_inflate_rate;
		}
		
		ingest(actor_id,entrance, type, global.scene_inflate_rate);
		
		
		
		//if (snd_action != noone && !audio_is_playing(snd_action))
		//	audio_play_sound(snd_action, 0, 0);
}

if (global.scene_fg != noone && global.scene_fg != sprBlank){
	//with ()
	var actor = actors[| 0]; //FIX?
	if (!variable_struct_exists(surfs,"fg") || !surface_exists(surfs[$ "fg"])){
		surfs[$ "fg"] = surface_create(room_width, room_height);	
		surface_set_target(surfs[$ "fg"]);
		draw_sprite(global.scene_fg, 0, 0, 0);
		surface_reset_target();
	}
	
	skew_y = 0;
	skew_x = actor.skew_x;
	draw_set_color(c_white);
	skew_draw_surface(surfs[$ "fg"], 0, 0);
	//skew_draw_other(actor, global.scene_fg, 0, 0,0);
	
}