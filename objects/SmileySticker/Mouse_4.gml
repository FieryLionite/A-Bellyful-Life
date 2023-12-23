text = "";
switch (image_index){
	case 0:
		text = "Happy";
	break;
	case 1:
		text = "A little bored.";
	break;
	case 2:
		text = "Very bored! Do something fun.";
		break;
	break;
	case 3:
		text = "Bored out of your mind! You don't want to do anything boring, like skipping time.";
	break;
	default:
		text = "Error, image index = " + string(image_index);
	break;
}

tooltip_start(x,y, "Mood", text);