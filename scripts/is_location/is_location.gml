function is_location() {
	return !(room == rmJournal || room == rmBackpack || room == rmInteract 
		|| room == rmKitchenFridge || room == rmCharger
		|| room == rmStatus || room == rmScene || room == rmShop || room == rmSaveLoad
	    //|| room == rmMapUni || room == rmMapShopping// || room == rmGeneralStore 
	    || room == rmStat || room == rmAbilities || room == rmSettings || room == rmMassage
		|| room == rmInternalView || room == rmConsole);
}

function is_map(){
	return is_map_room(room);
}

function is_map_room(rm){
	if (rm == rmMapCountryside || rm == rmMapUni || rm == rmMapShopping || rm == rmMapResort)
		return true;
	return false;
}


function is_location_room(rm) {
	if (rm == rmJournal || rm == rmBackpack || rm == rmInteract || rm == rmKitchenFridge
		|| rm == rmStatus || rm == rmScene || rm == rmShop
	    //|| rm == rmMapUni// || rm == rmMapCity// || rm == rmGeneralStore 
	    || rm == rmStat || rm == rmAbilities)
	    return false;
	else
	    return true;
}
