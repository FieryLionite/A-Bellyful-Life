/// @description say(msg, blush = false, duration)
/// @param msg
/// @param  blush = false
/// @param  duration
function say2() {

	var msg = argument[0];
	var duration  = 3*string_length(msg);
	var blush = false;

	if (argument_count >= 3)
	    duration = argument[2];
    
	if (argument_count >= 2)
	    blush = argument[1];

	with (Dialogue) msg_reset();
	Dialogue.msg = msg;
	Dialogue.alarm[0] = duration;
	global.patient.blushing = blush;
	expression_set(ex_happy, duration*0.9);



}
