/// @description action_pump(zone);
/// @param zone
function action_pump() {
	
}
/*function action_pump(argument0) {
	var zone = argument0;
	var char = global.dialogue_char;
	var item;
	for (i = 0; i < instance_number(Item); i++){
	    item = instance_find(Item,i);
	    if (item.character == char &&
	        item.object_index == IAir){
	        if (item.in_stomach){
	            if (zone != global.zone_stomach){
	                return 0;
	            }
	        }else{
	            if (zone != global.zone_bowel){
	                return 0;
	            }
	        }
        
	        item.volume += 300;
	        return 0;
	    }
	}
	var in_stomach = false;
	var in_bowels = false;
	if (zone == global.zone_stomach){
	    in_stomach = true;
	    in_bowels = false;
	}else{
	    in_stomach = false;
	    in_bowels = true;
	}

	item = instance_create(zone.x, zone.y, IAir);
	item.character = char;
	item.in_stomach = in_stomach;
	item.in_bowels = in_bowels;
	var card = instance_create(zone.x+100, zone.y+50, ItemCard);
	card.item = item;



}*/
