// Inherit the parent event
event_inherited();

//if (!is_location() || instance_exists(obj_textbox) || instance_exists(dropdown_dialogue))
if (ControlEnv.hours >= 21 && ControlEnv.hours < 23 && !warn_sleep1){
	warn_sleep1 = true;
	instance_create_depth(0,0,-1000, Eyelid);
}

if (ControlEnv.hours >= 23 && !warn_sleep2){
	warn_sleep2 = true;
	instance_create_depth(0,0,-1000, Eyelid);
}

if (is_location() && (ControlEnv.hours > 23 &&ControlEnv.minutes > 30 || ControlEnv.hours < 6)){
		if (!ControlEnv.go_resort){
			global.last_room = rmBedroom;
			global.last_dest = rmBedroom;
		}else{
			global.last_room = rmBedroomResort;
			global.last_dest = rmBedroomResort;
		}
		ctb_list(d_player_sleep, noone, 
			strlan(
				EN, "Begrudgingly, you returned to your bed because you're too tired to stay awake any longer.",
				CN, "因为你太困了，你不情愿地上床睡觉。",
				JP, "今日は疲れて眠い。あなたは布団に潜り込んだ。",
				RUS,"Неохотно ты вернулась в кровать, потому что слишком устала, и не можешь оставаться на ногах."
			)
		
		);
}

hunger = 0;
hours_without_eating = -((undigested_calories + daily_calories)/hourly_calories_uptake);
if (hours_without_eating >= 4){	
	hunger = 1;	
}
if (hours_without_eating >=7){	
	hunger = 2;	
}
if (hours_without_eating >=12 && is_location()){
	/*show_debug_message("hourly_calories_uptake" + string(hourly_calories_uptake))
	show_debug_message("daily_calories" + string(daily_calories))
	show_debug_message("undigested_calories" + string(undigested_calories))
	show_debug_message("hours_without_eating" + string(hours_without_eating))*/
	
	var clinic_room = rmClinic;
	if (ButtonMap.last_map == rmMapResort)
		clinic_room = rmBedroomResort;
	
	/*if (ControlEnv.resort_days > 0)
		clinic_room = rmBedroomResort;
	else
		show_message(ControlEnv.resort_days)*/
	
	if (room != clinic_room)
		custom_goto(clinic_room);
	else{
		daily_calories = 0;
		global.last_dest = clinic_room;
		time_forward_minutes(30);
		Nurse.bills += 100;
		ctb_list(noone, noone, 
			strlan(
				EN, "You collapsed from hunger and was taken to the clinic. Please pay the medical bill before you leave. ",
				CN, "你饿晕了，被送到了诊所。离开之前请先结账。",
				JP, "空腹で倒れて、病院に搬送された。退院する前に医療費を払ってください。",
				RUS,"Ты потеряла сознание от голода и попала в клинику. Пожалуйста, оплати медицинский счет перед отъездом. "
			)
			)
	}
}

if (last_hours_without_eating>=4 && last_hours_without_eating < floor(hours_without_eating)){
		play_stomach_sound();
}

last_hours_without_eating = floor(hours_without_eating);