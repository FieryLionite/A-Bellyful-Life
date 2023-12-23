function msg_Remi_catch_failed_EN(){
	ctb_msg(
		"[speaker:Remi][ex:ex_surprise]Stop in the name of the law",
		"[speaker:Player]What seems to be the problem officer?",
		"[speaker:Remi][ex:ex_blush]uh...",
		"[speaker:Remi][ex:ex_talk]Were there no pump related shenanigans happening about here?",
		"[speaker:Player]Pump related who now?",
		"[speaker:Remi][ex:ex_sad]The cop looks defeated.",
		"[speaker:Remi][ex:ex_sad]I apologise for the inconveniance maam",
		//"[speaker:Player]Heyy, don't worry about it. My name's Player",
		//"[speaker:Remi][ex:ex_talk]Remi",
		"[speaker:Remi]I'm still suspicous of you, so come down to the police station when you get a chance, I want to inspect you.",
		"[speaker:noone]*You blush*",
		"[speaker:Remi][ex:ex_surprise]NOT LIKE THAT PERVERT!!",
		"[ex:idle][speaker:Player][c:blue]I should probably go down to the police station, this lady seems oddly incompetent"
	)
}

function msg_Remi_catch_success_EN(){
	ctb_msg(
		 // arresting the player
		"[speaker:Remi][ex:ex_talk]Stop in the name of the law!",
		"[speaker:Player]Shit!",
		"[speaker:Remi][ex:ex_surprise][sound:belly_slosh]What in all the public indecency is th-",
		"[speaker:noone]*Remi looks at your bulging belly and seems to have stopped in her tracks*",
		"[speaker:Remi][ex:ex_blush]What the hell is even that?!",
		"[speaker:Player]Well, you see officer...",
		"[speaker:Player]*You Explain to the officer how you got your belly so big*",
		"[speaker:Remi][ex:ex_blush]uh...",
		"[speaker:Remi][ex:ex_surprise]OK! Stop, put your hand behind your head and drop the air pump",
		"[speaker:Player][ex:ex_surprise]*You comply immedately*",
		"[speaker:Remi][ex:idle]I'm going to have you pay a hefty fine for such as lewd public misconduct",
		"[ex:idle][speaker:Player]I'm sorry officer Remi, it won't happen again! [c:blue] (for now....)",
		"[speaker:noone] You paid Remi a fine of $50 and was warned not to do it again."
	)
}