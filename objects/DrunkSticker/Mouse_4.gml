if (!visible)
	exit;

title = "";
text = "";
if (target.alcohol > 20 && target.alcohol < 40){
	title = "A little tipsy";
	text = "";
}else if (target.alcohol < 70){
	title = "Drunk";
	text = "Maybe you've had enough drinks? It will take longer to move around, you may also loose track of time sometimes.";
}else{
	title = "Wasted";
	text = "You can't tell the sky from the earth. Walking becomes an extremely difficult task. How are you gonna get home?";
}

tooltip_start(x,y - 350, title, text);