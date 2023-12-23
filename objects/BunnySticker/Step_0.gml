event_inherited();

if (target != noone){
	visible = (target.jittery > 30);
}else
	exit;
var jitter = 0;
if (target.jittery > 30 && target.jittery < 50){
	jitter = 1;
}else if (target.jittery < 80){
	jitter = 3;
}else{
	jitter = 6;
}

if (x > 0){
	x = xstart + random_range(-jitter, jitter);
	y = ystart + random_range(-jitter, jitter);
}