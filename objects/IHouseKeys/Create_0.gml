event_inherited();
volume = 0;
calories = 0;
is_tool = true;
price = 0;
desc = "Your home key, welcome to your new mansion!"
uses = 1;
consumable = false;
script_use = function(){
	exelan("msg_drag_tutorial");
}
//desc = "Pump air into stuff. (Note: air will escape if you are filled above 90% capacity)";