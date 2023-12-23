if (!instance_exists(item)){
	instance_destroy();
	exit;
}

depth = -99;

draw_cached();
draw_self();
draw_set_font(fontReport);
draw_set_color(c_black);
var display = item.name;
/*var entry =  global.item_names[? string_replace(item.name, " ", "")];
if (entry != undefined)
	display = entry[| global.language-1];*/
draw_text(x+ 10,y+8, string_hash_to_newline(display));
draw_set_font(fnt_dialogue);

draw_set_color(c_white);
if (item.price > 0)
	draw_text(x+10,y+ 70, string_hash_to_newline("Price: $" + string(item.price)));

if (item.volume > 0){
	draw_text(x+10,y+ 105, string_hash_to_newline("Volume: " + string(item.volume) + "cc"));
	draw_text(x+10,y+ 142,  string_hash_to_newline("Calories: " + string(item.calories)));
}

var desc = item.desc;
if (item.energy > 0)
	desc = "Energy: +" + string(item.energy) + ". "  + desc;
if (item.alcohol > 0)
	desc = "Alcohol: +" + string(item.alcohol) + ". "  + desc;
if (item.high > 0)
	desc = "High: +" + string(item.high) + ". "  + desc;

if (item.do_expire){
	if(item.expire_in > 60)
		desc += "#" + ("Hours left: " + string(item.expire_in/60));
	else
		desc += "#" + ("Minutes left: " + string(item.expire_in));
}else if (item.uses > 0){
	desc += "#" + ("Uses left: " + string(item.uses));
}	
	
draw_text_ext(x+10,y+ 177, string_hash_to_newline(desc), -1, 450);
//if(item.hours_left > 0)


draw_load_cache();