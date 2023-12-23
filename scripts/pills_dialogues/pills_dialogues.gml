function d_pill_digest(){
	
}

function d_pill_diet(){

}

function d_pill_gas(){
	ctb_msg("[speaker:"+str(global.dialogue_char.object_index)+"][ex:ex_blush][sound:snd_hungry4] Oh gosh, I feel so bloated all of a sudden",
	"[speaker:Player]Hmm, I know how to fix this",
	"[speaker:"+str(global.dialogue_char.object_index)+"][sound:burp][font:tiny]ooh that's nice...",
	"[speaker:noone]*You poke your fingers just below her bellybutton making her burp and moan*",
	"[speaker:"+str(global.dialogue_char.object_index)+"][ex:ex_blush][font:tiny]ahh... oooh... I liked that [font:normal]",
	"[speaker:noone]You have raised "+global.dialogue_char.name+"'s like of inflation a fair bit. Keep it up ;)",
	"[speaker:"+str(global.dialogue_char.object_index)+"][ex:ex_idle]");
}

function d_pill_noise(){
	ctb_msg("[speaker:noone][ex:ex_blush]*"+str(global.dialogue_char.name)+" is looking at you clearly embarrased by her gurgling belly*",
		"[speaker:Player] Hey, is everything alright?",
		"[speaker:"+str(global.dialogue_char.object_index)+"] Yeah, it's just my stomach is being really loud right now, hehe",
		"[speaker:Player] That's okay, It's kinda cute to me",
		"[speaker:"+str(global.dialogue_char.object_index)+"][ex:ex_blush][font:tiny] Thank you. [font:normal]",
		"[speaker:Player][c:blue] Oh my god that's so hotttt[c:default]",
		"[speaker:"+str(global.dialogue_char.object_index)+"][ex:ex_idle]");
}
