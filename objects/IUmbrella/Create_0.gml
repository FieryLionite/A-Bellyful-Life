event_inherited();
desc = "Allows you to move faster in the rain";

price = 15;
is_tool = true;
do_expire = false;

if (ControlEnv.has_umbrella){
	ControlEnv.money += price;
	tooltip_start(room_width/2, 100, "Error", "You already bought an umbrella!");
}