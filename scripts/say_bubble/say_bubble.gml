/// @description say(char, msg, duration)
/// @param char
/// @param  msg
/// @param  duration
function say_bubble() {

	var char = argument[0];
	var msg = argument[1];
	var duration  = 5*string_length(msg);
	var bubble = char.bubble;
	if (duration < 30)
	    duration = 30;
	if (argument_count >= 3)
	    duration = argument[2];


	with (bubble) msg_reset();
	bubble.msg = msg;
	bubble.alarm[0] = duration;



}
