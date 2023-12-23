// Inherit the parent event
event_inherited();

if (!is_template){
	ControlEnv.has_bike = true;
	instance_destroy();
}