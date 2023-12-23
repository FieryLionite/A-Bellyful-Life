target_room = rmAlley;
name = "Random Alley";

display = strlan(EN, name, RUS, "Случайная аллея ", JP, "ランダムな路地", CN, "随机胡同 ");

if (!Bobbie.met_player)
	instance_destroy();