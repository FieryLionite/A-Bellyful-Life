event_inherited();
desc = "Allows you to travel on the map with half the time and energy cost";

price = 150;
is_tool = true;

if (ControlEnv.has_bike){
	ControlEnv.money += price;
	tooltip_start(room_width/2, 100, "Error", "You already bought a bike!");
}