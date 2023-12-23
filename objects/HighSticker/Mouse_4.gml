if (!visible)
	exit;

title = "";
text = "";
if (target.high < 30){
	title = "A little high in the clouds";
	text = "You're a bit high after smoking some nice weed (Unfortunately this effect is not properly implemented yet!)";
}else{
	title = "High up in the cosmos";
	text = "You're extremely high after inhaling some very exotic weed! (Unfortunately this effect is not properly implemented yet!)";
}

tooltip_start(x,y - 350, title, text);