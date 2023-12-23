function fcashier_location(){
	return rmFatbucks;
}

function fcashier_dialogue(){
	
	dialogue_init();
	

	if (!FatbucksCashier.player_registered){
		dialogue_create(
		        "1",
		        "Ask for part time job",
		        true,
		       d_fcashier_ptj
		)
	}else{
		dialogue_create(
		        "1",
		        "Quit part time job",
		        true,
		       d_fcashier_quit
		)
	}
	
	dialogue_create(
		        "2",
		        "Make a purchase",
		        true,
		       d_fbucks_shop
		)

	dialogue_start(true);
}

function d_fbucks_shop(){
		global.shop_bg = background_get();
		global.shop_items = list_create(IEspresso, IFrappuccino, IGreenTeaFrap, IOrangeJuice, ISoda, ICakeSlice);	
		global.last_room = room;
		custom_goto(rmShop);
}

function d_fcashier_quit(){
	FatbucksCashier.last_cancelled = 3;
	FatbucksCashier.player_registered = false;
	
	ctb_list(noone, noone, "You're no longer a Fatbucks employee");
}

function d_fcashier_ptj(){
	if (FatbucksCashier.last_cancelled > 0){
		ctb_list(noone, noone, "You've just quit recently! Maybe wait a few more days?");
		return;
	}
	
	
	dialogue_init();

	dialogue_create(
	        "1",
	        "Accept!",
	        true,
	       d_fcashier_accept
	)
	
	dialogue_create(
	        "2",
	        "I'll think about it",
	        false,
	       "Alright"
	)

	dialogue_start(false);
	ctb_list(noone, noone,"You took some time to contemplate the job:#The pay is alright, but you'll need to spend more energy dealing with detailed customer orders.","(Per hour) pay: $16, energy use: 14, mood: somewhat  boring");
}

function d_fcashier_accept(){
	FatbucksCashier.player_registered = true;
	
	dialogue_init();

	dialogue_create(
	        "1",
	        "7-12am",
	        true,
	       d_fcashier_1stshift
	)
	
	dialogue_create(
	        "2",
	        "12am-5pm",
	        true,
	       d_fcashier_2ndshift
	)
	
	dialogue_create(
	        "3",
	        "5pm-10pm",
	        true,
	       d_fcashier_3rdshift
	)

	dialogue_start(false);
	ctb_list(noone, noone,"Welcome abroad! Which shift do you want to take?");
}

function d_fcashier_1stshift(){
	FatbucksCashier.player_shift = 1;
}
function d_fcashier_2ndshift(){
	FatbucksCashier.player_shift = 2;
}
function d_fcashier_3rdshift(){
	FatbucksCashier.player_shift = 3;
}