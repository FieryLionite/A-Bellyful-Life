function instance_create_delay(argument0, argument1, argument2) {
	var delay = instance_create(argument0, argument1, DelayMaker);
	delay.make = argument2;

	return delay;



}
