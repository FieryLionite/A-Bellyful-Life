if (!visible)
	exit;

title = "";
text = "";
if (target.jittery > 30 && target.jittery < 50){
	title = "Somewhat jittery";
	text = "You're a little on edge after drinking some energy drinks. You may spend a little more energy (8%) doing things";
}else if (target.jittery < 80){
	title = "Very jittery";
	text = "You're very agitated after drinking a ton of energy drinks! Don't drink anymore for the day. Normal actions will cost more energy (15%) because you're so on edge.";
}else{
	title = "Weeeeeee";
	text = "You feel like you're gonna have a heart attack after downing so much energy drinks! Cost 30% more energy when performing actions.";
}

tooltip_start(x,y - 350, title, text);