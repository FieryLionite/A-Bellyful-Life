event_inherited();
script_location = function(){
	if (!DEB.met_player || DEB.shrink > 0)
		return noone;
		
	if (DEB.following && in_house() && is_location())
		return room;
	else 
		return rmBedroomDEB;
};
script_dialogue = DEB_dialogues;
sprite_expression = sprDEBExpressions_0;

met_player = false;

//signal second time jogging
jogged_today = false;

//has_number = true;

eating_out_init(rmFataurant, list_create(IBeer, IHotdog, ICakeSlice));

massage_x = 498;
massage_y = 171;

likability = 50;
desire_inflate = 50;
desire_stuffing = 50;

get_visit_gifts = function(){
	return [choose(random_fruit(), random_meal(), random_softdrink()),
		choose(random_fruit(), random_meal(), random_softdrink())];
}