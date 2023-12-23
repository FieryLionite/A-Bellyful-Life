function in_house(){
	var rm = room;
	if (rm == rmScene)
		rm = global.last_room;
	
	return (rm == rmBedroom || rm == rmBathroom || rm == rmLivingroom ||
		rm == rmGreenhouse || rm == rmKitchen || rm == rmBedroomDEB);
}