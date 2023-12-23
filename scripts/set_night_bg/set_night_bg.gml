function set_night_bg() {
	/*if (__background_get( e__BG.Index, 0 ) == sprCityMap)
	    __background_set( e__BG.Index, 0, sprCityMapNight );
		
	if (__background_get( e__BG.Index, 0 ) ==sprShoppingDistrict)
	    __background_set( e__BG.Index, 0, sprShoppingDistrictNight );
		
		if (__background_get( e__BG.Index, 0 ) ==sprFatdonalds )
	    __background_set( e__BG.Index, 0, sprFatdonaldsNight );*/
   
   if (background_get( ) == sprMapResort)
	    background_set(sprMapResortNight );
		
   if (background_get( ) == sprBeachDay)
	    background_set(sprBeachNight );
   
   if (background_get( ) == sprRestaurantResortDay)
	    background_set(sprRestaurantResortNight );
		
if (background_get() == sprCityMap)
	    background_set(sprCityMapNight );
		
	if (background_get() ==sprShoppingDistrict)
	    background_set(sprShoppingDistrictNight );
		
	if (background_get() ==sprFatdonalds )
	    background_set(sprFatdonaldsNight );
		
	if (background_get() ==sprCountryside )
	    background_set(sprCountrysideNight );

}
