/// @description dialogue_question(title, text, script)
/// @param title
/// @param  text
/// @param  script
function dialogue_question(argument0, argument1, argument2) {
	var xx, yy;
	if (view_enabled){
	    xx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
	    yy = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2 - 25 - sprite_get_height(sprYesNo)/2;
	}else{
	    xx = room_width/2;
	    yy = room_height/2 - 25 - sprite_get_height(sprYesNo)/2;
	}

	var d = instance_create(xx,yy, DialogueYesNo);
	d.title = argument0;
	d.text = argument1;
	d.script = argument2;



}
