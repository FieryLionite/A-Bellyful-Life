function character_tick(minutes){
	character_status_step(minutes);
	pressure_step(minutes);
	
	if (using_vibrator and lust < 100){
		lust += minutes/3;
	}
	
	if (plugged and lust < 100){
		lust += minutes/3;
	}
	
	if (lust > 0)
		lust -= minutes/4;
	
	if (stress > 0)
		stress -= minutes/2;
	
	if (!visiting && following){
		show_message("Error: " + name +" following without visiting! Force fixed.")
		following = false;	
	}
	
	if (in_bathroom > 0){
		in_bathroom-= minutes;	
	}
	
		digest_step(minutes);	
		if (visit_arrival > 0){
			visit_arrival -= minutes;
			if (visit_arrival <= 0){
					visiting = true;
					visit_minutes = 180;
					visited = true;
					arrived_notice = true;
			}
		}
		
		//if (visit_minutes > 0){
		//if (shrink <= 0)
		if (visit_minutes > 0 && shrink <= 0)
			visit_minutes -= minutes;
		//}
		
		if (shrink > 0){
			shrink -= minutes;	
			if (shrink <= 0){
				var oname = object_get_name(object_index);
				
				ctb_msg(cmd_speaker(noone)+
					oname + " grew back to their original size."
				);
				
				if (Player.micro_bowels == oname){
					Player.micro_bowels = noone;
				}
				
				if (Player.micro_stomach == oname){
					Player.micro_stomach = noone;
				}
				
				if (Player.micro_womb == oname){
					Player.micro_womb = noone;
				}
			}
		}
		
		
}

function character_finish_visit(char){
	if (is_undefined(char))
		char = global.dialogue_char;
		
	with (char){
		visit_minutes = 0;
		visiting = false;
		following = false;
	}
}