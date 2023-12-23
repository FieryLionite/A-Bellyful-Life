/// @description consume(calories)
/// @param calories
function consume(argument0) {
	calories += argument0;
	if (calories > stomach_max*3){
	    var carry_over = calories - stomach_max*3;
	    calories = carry_over;
	    if (level < 2)
	        level ++;
	}



}
