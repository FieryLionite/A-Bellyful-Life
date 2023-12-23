event_inherited();

script_location = Amber_location;
script_dialogue = Amber_dialogues;
sprite_expression = sprAmberExpressions_0;

met_player = false;

//signal second time jogging
jogged_today = false;

//has_number = true;

eating_out_init(rmFataurant, list_create(IBeer, IHotdog, ICakeSlice));

massage_x = 473;
massage_y = 196;

alphaL = 0.8;

get_visit_gifts = function(){
	return [random_fruit(), random_softdrink()];
}