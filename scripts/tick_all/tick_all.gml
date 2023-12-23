/// @description tick_all(hours)
/// @param hours
function tick_all(argument0) {

	close_time_kick();

	var hours = argument0;
	/*for (var i = 0; i < instance_number(Character); i ++){
	    var char = instance_find(Character, i);
    
	}*/

	for (i = 0; i < instance_number(Item); i++){
	    item = instance_find(Item,i);
	    if (item.in_stomach || item.in_bowels){
	        item.hours_left -= hours;
	        if (item.hours_left < 0){
	            var char = item.character;
	            char.calories_absorbed += item.calories;
	            with (item) instance_destroy();
            
	            if (char.calories_absorbed >= char.fat_level*1000){
	                char.calories_absorbed -= char.fat_level*1000;
	                char.fat_level ++; 
	            }
	        }
	    }
	}




}
