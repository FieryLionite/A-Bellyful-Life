event_inherited();
desc = "A must have for any newbie streamer! Although your budget phone might not make the best camera.";

price = 35;
is_tool = true;
do_expire = false;

if (ControlEnv.has_tripod){
	ControlEnv.money += price;
	tooltip_start(room_width/2, 100, "Error", "You already bought a tripod!");
}