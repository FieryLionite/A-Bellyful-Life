#macro CHAT_WIDTH 300

function gen_name() {
	var name = "";
	for (var i=0; i<random_range(2,5); i++)
	    name += "x";
	return name;
}

function gen_text(){
	if (BtPlay.toggled){
		return choose(
			"Inflate more!",
			"Look at that belly!",
			"Nice!",
			"Inflate till you pop!",
			"I love seeing your belly grow!",
			"more! more!",
			"Don't stop!",
			"Why am I watching this (but getting turned on)??",
			"What a lovely round tummy~",
			"Wow you look pregnant!",
			"I'm on the weird side of Twitch again aren't I?",
			"So round!",
			"Looking a bit tight there "+Player.name+"~ :3",
			"What did you eat!?",
			"I'm not sure what I expected, but this certainly wasn't it.",
			"xDaymn gurl you're lookin massive!",
			"jeez doesn't that hurt?",
			"I wish I could rub that belly!",
			"How do you get so big? any tips perhaps?",
			"what a lovely balloon belly~",
			"you're looking ready to pop!",
			"lol you're gonna get fat",
			"damn preggo's got nothin on you~",
			"That's amazing! just try not to overdo it okay? :(",
			//"Is this a fetish or something? Not kinkshaming just curious.",
			"You're an absolute goddess of bellies!",
			"what equipment do you use?",
			"That's the biggest I've seen you yet!",
			"I'm sure you could take a little more?~",
			//"So huge~ just make sure to rub in some oil to avoid stretch marks! or don't~",
			"what's it feel like to be that full?",
			"how are you so good at this!?",
			//"Uh oh~ looks like you can't stretch much more~ it would be a shame if you just kept going~",
			"ooh, that's good keep doing that",
			"Bruh, what is this???",
			"Jeez what's this girl's max?",
			"I wish I could get that big.",
			"Ugh, I feel bloated just watching this",
			"How much longer till that shirt rips off?"
		)
	}else{
		return choose(
			"Boring!",
			"Why did you stop??",
			"Noooo",
			"Noo",
			"Please continue!",
			"I'm leaving",
			"Oh come on",
			"Aww I wanted her to continue",
			"You can't stop now!",
			"Keep going please!",
			"Are you finished already??"
		)
	}
}

function create_chat_entry(){
	global.entry = instance_create(0,0, ChatEntry);

	with (ChatEntry){
	    if (id != global.entry){
	        y -= global.entry.height;
	    }
	}
}
