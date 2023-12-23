visible = !(char.lust >= 100 or char.stress >= 100)

if (dragging){
	var bx = ControlMassage.belly_x;
	var by = ControlMassage.belly_y;
	
	x = mouse_x;
	y = mouse_y;
	if (drag_func != noone)
		drag_func();
		
	if (point_distance(x,y,bx, by) > 100 or !position_meeting(x,y,ControlMassage)){
		touching = false;
	}else{
		if (!touching){
			touching = true;
			if (cream > 0)
				audio_play_sound(sndSlap, 0, 0);
		}
		if (cream > 0){
			cream --;
			instance_create_depth(x,y,0,o_liquid);
			
			var likability = clamp(char.likability, 0,100);
			var stressInc = (1-likability/100)/5
			var lustInc = (char.libido/100+1)/15
			char.stress += stressInc;
			ControlMassage.lustInc += lustInc;
			char.lust += lustInc;
			Player.energy -= 0.005;
		}
	}
}else{
	touching = false;
	scale_left = scale;
	scale_right = scale;
	
	if (point_distance(x,y,xstart, ystart) > 30){
		x += (xstart - x)/5;
		y += (ystart - y)/5;
	}else{
		x = xstart;
		y = ystart;
	}
}