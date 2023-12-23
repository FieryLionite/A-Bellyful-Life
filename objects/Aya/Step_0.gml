// Inherit the parent event
event_inherited();

if (ControlEnv.hours >= 6 && ControlEnv.minutes > 30 && !first_text && is_location()
	&& in_house()
	&& !instance_exists(obj_textbox) && !instance_exists(dropdown_dialogue)){
	first_text = true;
	//var char = global.dialogue_char;
	global.dialogue_char = id;
	/*ctb_list(noone, noone, 
		cmd_speaker(Aya)+"(You received a text from Aya, your high school best friend who's also going to the same uni with you after summer ends.)",
		"Hey Ayume! I heard that you moved into a fancy new house today. I hope that you didn't forget your promise to study together with me throughout the summer.",
		"The university we're going to isn't the slacker type, the first semester is the toughest so I really want to get you ready for it!",
		"Also I'd love to check out your new place! Just give me a text and I'll come right over :)",
		"(You glanced at your contact list to see Aya's number being the only entry. You really need to make more friends here)"
	);*/
	ctb_list(noone, noone, 
		cmd_speaker(noone) + "You feel a buzz in your pocket and realize you’ve gotten a text. Unlocking your smartphone, you check to see who it is.",
		"It’s Aya, your best friend from high school.",
		cmd_speaker(Aya) + "Hey, "+Player.name+"! How are you doing?",
		cmd_speaker(noone) +"You shoot her a text back",
		cmd_speaker(Player) + "Im doin great!!! Just checkin the new place",
		cmd_speaker(Aya) + "How is it?",
		cmd_speaker(Player) +"OMFG IT IS AMAZING!!! Theres so much space here like wft",
		cmd_speaker(Aya) + "You’ll have to show me sometime.",
		"Amazing you won that place in a lottery. What are the odds?",
		cmd_speaker(Player) +"idk, pretty low probly lmao",
		cmd_speaker(Aya) + "I wonder...",
		cmd_speaker(Player) +"Don’t ACTUALLY do the math lol",
		cmd_speaker(Aya) + "But I’m curious now.",
		 "You r such a nerd and i luv it lmao :)",
		"I prefer the term intellectual.",
		cmd_speaker(noone) + "You chuckle to yourself. Aya is so formal that her texts are written with perfect grammar and spelling.",
		"It’s a far cry from your own texting shorthand, which is almost unreadable sometimes.",
		cmd_speaker(Player) +"Speaking of smart stuff, u xcited for uni?",
		cmd_speaker(Aya) + "Honestly, I’m nervous.",
		"[University Name] isn’t an easy school to get into, and it’s no place for slackers.",
		"We’re going to have to work extra hard to make a good first impression.",
		cmd_speaker(Player) +"lol if I have to",
		cmd_speaker(Aya) +"We’ll have to",
		"We may have gotten into [University Name], but we need to keep our grades up if we want to stay.",
		cmd_speaker(Player) +"dangit",
		cmd_speaker(Player) +"whatever, we’ll be okay",
		cmd_speaker(Aya) +"If you say so",
		"I have to go now. Text me whenever you want to give me a tour of your new place, okay?",
		cmd_speaker(Player) +"Def will",
		"cya",
		cmd_speaker(Aya) +"Goodbye",
		cmd_speaker(noone) + "You exit the Message app and check your contact list.",
		"You grimace when you see just how short it is.",
		"Aside from Aya, the only contacts in your phone are your parents.",
		"You let out a sigh. You wonder if you should use your free time this summer to make some new friends."
	);
	//global.dialogue_char = char;
	has_number = true;
}

if (visiting && !studied_today && room == rmLivingroom
	&& !arrived_notice && !instance_exists(obj_textbox)){  //check if the arrived message is playing (happens when she arrives in the same room the player is in
	if (first_visit){
		first_visit = false;
		studied_today = true;
		aya_study_first();
	}else{
	global.scene_script = aya_study;	
	studied_today = true;
	scene_start();
}
	}
	
//reset study flag on new day
if (!visited)
	studied_today = false;