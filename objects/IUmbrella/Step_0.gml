// Inherit the parent event
event_inherited();

if (!is_template){
	ControlEnv.has_umbrella = true;
	instance_destroy();
}