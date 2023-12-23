// Inherit the parent event
if (ready)
	event_inherited();
else {
	x += 8;
	if (x >=  0){
			x = 0;
			ready = true;
	}
}

if (event_day != ControlEnv.day ||( event_start_hour <= ControlEnv.hours && event_start_minute <= ControlEnv.minutes))
	instance_destroy();
	