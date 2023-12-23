/// @description dialogue_ok(title, text)
/// @param title
/// @param  text
function dialogue_ok(argument0, argument1) {
	//show_message_async(argument1);
	ctb_msg(argument1);
	return 0;
	
	var xx, yy;
	if (view_enabled){
	    xx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
	    yy = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2 - 5 - sprite_get_height(sprYesNo)/2;
	}else{
	    xx = room_width/2;
	    yy = room_height/2 - 5 - sprite_get_height(sprYesNo)/2;
	}

	var d = instance_create(xx,yy, DialogueOk);
	d.title = argument0;
	d.text = argument1;



}
