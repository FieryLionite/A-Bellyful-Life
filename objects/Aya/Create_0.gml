event_inherited();
script_location = aya_location;
script_dialogue = aya_dialogue;
//script_idle = alice_idle;
//script_observe = alice_observe;

sprite_expression = sprAyaExpressions_0;

has_number = true;

first_text = false;

first_visit = true;
studied_today = false;

likability = 20;

eating_out_init(rmFatbucks, list_create(IFrappuccino, ICakeSlice, IApple))

arrive_msg = "Oh, are you gonna give me a tour of your new place?";

massage_x = 477;
massage_y = 135;

get_visit_gifts = function(){
	return choose([random_sweet_food(), random_softdrink()], [random_meal()]);
}