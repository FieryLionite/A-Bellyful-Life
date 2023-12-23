event_inherited();
script_location = Bambi_location;
script_dialogue = Bambi_dialogues;
//script_idle = alice_idle;
//script_observe = alice_observe;

sprite_expression = sprBambiExpressions_0;
//has_number = true;

eating_out_init(rmFatdonalds, list_create(IHugeburger,ISoda, IFries));

arrive_msg = "I like your place. Now that I'm here, I'll gladly help you with anything you need!";

met_player = false;
player_helped = false;

massage_x = 508;
massage_y = 274;

alphaL = 0.6;

get_visit_gifts = function(){
	return [random_meal(), random_meal()];
}