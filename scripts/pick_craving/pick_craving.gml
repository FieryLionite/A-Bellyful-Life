function pick_craving() {
	var num = instance_number(MenuItem);
	var pick_num = floor(random(num));

	return instance_find(MenuItem, pick_num);



}
