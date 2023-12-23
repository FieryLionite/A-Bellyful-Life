global.room_coins = {};

function room_set_coin_random(rm){
	room_set_coin(rm, choose(0,0,1,1,2), choose(0, 0,0,1), random(100000));
}


function room_set_coin(rm, coins, wallets, seed){
	global.room_coins[$ string(rm)] = {
		coins: coins,
		wallets: wallets,
		seed:seed
	}
}

function coins_reset(){
		room_set_coin_random(rmPark);
		room_set_coin_random(rmPool);
		room_set_coin_random(rmBarn);
		room_set_coin_random(rmAlley);
		room_set_coin_random(rmFataurant);
}

function room_make_coin(rm){
	if (!variable_struct_exists(global.room_coins, string(rm)))
		return;
	
	var config = global.room_coins[$ string(rm)];
	random_set_seed(config.seed);
	
	for (var i=0; i<config.coins; i++){
		var area = instance_find(CoinBlock,floor(random(instance_number(CoinBlock))));	
		var xx = random(1)*area.sprite_width;
		var yy = random(1)*area.sprite_height;
		var dir = point_direction(0,0,xx,yy);
		var dis = point_distance(0,0,xx,yy);
		
		var coin = instance_create_layer(
			area.x + lengthdir_x(dis, dir),
			area.y + lengthdir_y(dis, dir),
			"Instances", Coin);
			//show_message(coin.x)
			//show_message(coin.y)
	}
	
	for (var i=0; i<config.wallets; i++){
		var area = instance_find(CoinBlock,floor(random(instance_number(CoinBlock))));	
		var xx = random(1)*area.sprite_width;
		var yy = random(1)*area.sprite_height;
		var dir = point_direction(0,0,xx,yy);
		var dis = point_distance(0,0,xx,yy);
		
		var coin = instance_create_layer(
			area.x + lengthdir_x(dis, dir),
			area.y + lengthdir_y(dis, dir),
			"Instances", Wallet);
			//show_message(coin.x)
			//show_message(coin.y)
	}
}