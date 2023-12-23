function set_day_bg() {
	/*if (__background_get( e__BG.Index, 0 ) == sprCityMapNight)
	    __background_set( e__BG.Index, 0, sprCityMap );
		
	if (__background_get( e__BG.Index, 0 ) == sprShoppingDistrictNight)
	    __background_set( e__BG.Index, 0, sprShoppingDistrict );
		
		if (__background_get( e__BG.Index, 0 ) == sprFatdonaldsNight)
	    __background_set( e__BG.Index, 0, sprFatdonalds );*/
		
	if (background_get( ) == sprMapResortNight)
	    background_set(sprMapResort );
		
   if (background_get( ) == sprBeachNight)
	    background_set(sprBeachDay);
		
	if (background_get( ) == sprRestaurantResortNight)
	    background_set(sprRestaurantResortDay );

	if (background_get( ) == sprCityMapNight)
	    background_set(sprCityMap );
		
	if (background_get( ) == sprShoppingDistrictNight)
	    background_set(sprShoppingDistrict );
		
	if (background_get( ) == sprFatdonaldsNight)
	    background_set(sprFatdonalds );
		
	if (background_get( ) == sprCountrysideNight)
	    background_set(sprCountryside );
}
