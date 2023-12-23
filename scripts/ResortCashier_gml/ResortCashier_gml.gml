function rescashier_location(){
	return rmRestaurantResort;
}

function rescashier_dialogue(){
	
	dialogue_init();
	
	dialogue_create(
		        "1",
		        exelan("msg_make_purchase"),
		        true,
		       d_rescashier_shop
		)

	dialogue_start(true);
}

function d_rescashier_shop(){
		global.shop_bg = background_get();
		global.shop_items = list_create(ISundea, ISoda, IHamburger, IHotdog, IFrappuccino);	
		global.last_room = room;
		custom_goto(rmShop);
}