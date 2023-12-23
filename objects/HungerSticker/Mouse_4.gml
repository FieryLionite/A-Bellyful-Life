if (!visible)
	exit;

title = "";
text = "";
switch (image_index){
	case 0:
		title = "Hunger"
		text = "You're getting hungry, eat something.";
	break;
	case 1:
		title = "Starving!"
		text = "Loose a small amount of energy over time. You may faint if you starve for too long!";
	break;
}

tooltip_start(x,y, title, text);