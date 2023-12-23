event_inherited();
script_location = Bobbie_location;
script_dialogue = Bobbie_dialogues;
sprite_expression = sprBobbieExpressions_0;

met_player = false;
first_stuffing = false;
//has_number = true;

eating_out_init(rmFatdonalds, list_create(IFries, IHotdog, IHotdog));

massage_x = 511;
massage_y = 289;

get_visit_gifts = function(){
	return [choose(IWeedBag, ICigarettePack),IBeer];
}