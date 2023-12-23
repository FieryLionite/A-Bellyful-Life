// Inherit the parent event
event_inherited();

if (!is_template){
	ControlEnv.has_tripod = true;
	instance_destroy();
}