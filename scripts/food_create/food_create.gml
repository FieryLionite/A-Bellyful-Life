function food_create(argument0) {
	var item = argument0;
	var food = instance_create(100,100,Food);
	food.sprite_index = item.sprite_index;
	food.price = item.price;
	food.weight = item.weight;
	food.calories = item.calories;
	food.bites = item.bites;
	food.bites_max = food.bites;
	food.num = item.num;
	food.draggable = item.draggable;
	food.forkable = item.forkable;
	food.spoonable = item.spoonable;
	food.biteable = item.biteable;
	food.color = item.color;
	food.item = item;
	food.name = item.name;
	food.type = item.type;
	return food;



}
