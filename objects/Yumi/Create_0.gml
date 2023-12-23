event_inherited();
script_location = Yumi_location;
script_dialogue = Yumi_dialogues;
//script_idle = alice_idle;
//script_observe = alice_observe;

sprite_expression = sprYumiExpressions_0;
interested = false;
gave_exam_today = false;
//has_number = true;

eating_out_init(rmBar, list_create(ICocktail1, ICocktail2));

arrive_msg = "Alright, I'll give your place a thorough inspection!";

massage_x = 469;
massage_y = 218;

alphaL = 0.8;

get_visit_gifts = function(){
	return [choose(IPillDiet, IPillDigest, IPillGas, IPillLaxative, IPillNoise),
		choose(IPillDiet, IPillDigest, IPillGas, IPillLaxative, IPillNoise),
		choose(IPillDiet, IPillDigest, IPillGas, IPillLaxative, IPillNoise)];
}