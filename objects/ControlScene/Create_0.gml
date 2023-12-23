//audio_stop_all();
script_execute(global.scene_script);
if (!global.scene_exit)
	with(btArrowNavi) instance_destroy();
watched_inflate = false;

alarm[0] = 1;

surfs = {};

bgm = noone;