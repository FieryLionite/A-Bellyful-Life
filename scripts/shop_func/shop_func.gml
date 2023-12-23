function buy1(){
	buy_num = 1;
	buy_func();
}

function buy5(){
	buy_num = 5;
	buy_func();
}

function buy10(){
	buy_num = 10;
	buy_func();
}

function buy_func(){
	BuyWindow.buy_num = buy_num;
	with (BuyWindow){
		while (ControlEnv.money >= item.price && buy_num > 0){
			create_item(item);
			ControlEnv.money -= item.price;
			buy_num--;
		}
		with (ControlBackpack) refresh_backpack();
		instance_destroy();
	}
}