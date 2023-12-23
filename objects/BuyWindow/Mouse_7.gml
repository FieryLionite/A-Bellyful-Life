if (ControlEnv.money >= item.price){
   dialogue_init()
	
	dialogue_create(
	        "1",
	        "Buy 1",
	        true,
			buy1
	)
	
	dialogue_create(
	        "2",
	        "Buy 5",
	        true,
			buy5
	)
	
	dialogue_create(
	        "3",
	        "Buy 10",
	        true,
			buy10
	)
	
	dialogue_start(true);
}


