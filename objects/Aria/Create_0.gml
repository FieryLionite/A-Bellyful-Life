event_inherited();
script_location = aria_location;
script_dialogue = aria_dialogue;
//script_idle = alice_idle;
//script_observe = alice_observe;
sprite_expression = sprAriaExpressions_0;

finished_intro = false;
finished_intro_pump = false;
finished_pump = false;
practice = 0;

//has_number = true;
just_rescued = false;

eating_out_init(rmFatdonalds, list_create(IHamburger, IHotdog, ISoda))

arrive_msg = "Ok, where are we going?";

massage_x = 464;
massage_y = 128;


get_visit_gifts = function(){
	return choose([random_sweet_food(), random_softdrink()], [random_meal()]);
}