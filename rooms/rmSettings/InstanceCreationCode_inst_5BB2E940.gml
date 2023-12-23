name = "Christmas";
display = strlan(EN, name, RUS, "Рождество", JP, "クリスマス ", CN, "圣诞节");

script = function(){
	if (global.settings[? "Christmas"])
		with (Character) fat_level = 0; //hardcoded
}