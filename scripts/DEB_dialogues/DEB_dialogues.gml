function intro_DEB_portal(){
	DEB.met_player = true;
	DEB.has_number = true;
	ctb_list(intro_DEB_talk, noone,
		//see portal, poked it, DEB appeared disoriented and fell on her butt. Quickly help her up
		"[speaker:noone]Suddenly, a large portal appears and distorts a large portion of your garden!",
		"You approached and gave it a poke.",
		"[set_background:bgDEBIntro]",
		"Suddenly, a girl appears from the portal and fall on her butt!",
		"You quickly helped her up",
	)
}

function intro_DEB_talk(){
	//global.show_follower = true;
	create_character_holder(DEB.id);
	ctb_list(noone, noone, 
		//DEB intro dialogue
		"[set_background:sprGreenhouse]",
		"[speaker:DEB][ex:ex_smile2]This is awsome, Wonder where <p> is?",
		"[speaker:Player][c:blue]This girl clearly needs help...",
		"[speaker:Player]Hey... What are you doing?",
		"[speaker:DEB][ex:ex_blush]Well at the moment I'm looking for <p>! He has to go on our final date so he can inflate me!",
		"[speaker:Player][c:blue]Wow, that's the first time I heard someone use the term 'inflate' so casually...",
		"[speaker:Player][c:blue]hehehehe, I'd better offer her all the help I can...",
		"[speaker:Player][ex:ex_talk]Okay what's a '<p>' ",
		"[speaker:DEB][ex:ex_smile]It's the name of my true love of course!",
		"[speaker:Player]Odd name isn't it?",
		"[speaker:Player]Well what's your name?",
		"[speaker:DEB][ex:ex_smile2]My name is DEBUG but my friends call me DEB!",
		"[speaker:Player][c:blue]Man she totally lost it...",
		"[speaker:Player]Yeah well I'm "  + Player.name,
		"[speaker:Player]Well are you new here or do you have a place to stay?",
		"[speaker:DEB][ex:ex_sad]Well, I didn't think that far, I just got here.",
		"[speaker:Player][c:blue]Haha, I totally got this!",
		"[speaker:Player]How would you like to stay with me?",
		"[speaker:DEB][ex:ex_surprise]Really! I'd be delighted!",
		"[speaker:Player]Yeah, you just appeared in my mansion",
		"[speaker:DEB][ex:ex_surprise]A MANSION!",
		"[speaker:Player]Yeah, and I got a spare room with your name on it!",
		"[speaker:DEB][ex:ex_blush]does the room have a bathroom with a shower and or bathtub?",
		"[speaker:Player]Yup we're all good, So I'll show you the place!",
		"[speaker:DEB][ex:ex_idle]YAY!",
	)
}