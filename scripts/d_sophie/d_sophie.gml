function d_sophie(argument0) {
	var type = argument0;
	dialogue_init()
	var d = global.dialogues;
	dialogue_create(
	        "ask day",
	        choose("How was your day?", "How have your day been?"),
	        false,
	        choose("My day has been great, thanks for asking.",
	                "I'm having a nice day!")
	)

	dialogue_create(
	        "why here",
	        choose("What brings you here?", "What brought you to our program?"),
	        false,
	        "My life is going well you know, my career has been advancing steadily. That is, until yesterday I looked into the mirror and saw a skeleton!#I know that my busy life had taken away my desire to eat and enjoy food, and I want that back."
	)

	dialogue_create(
	        "compliment looks",
	        choose("You look great today!", "I love your outfit"),
	        false,
	        "Thank you!"
	)

	dialogue_create(
	        "ask mood",
	        choose("How are you feeling?", "How would you descrie your mood?"),
	        false,
	        "I'm happy that my career is advancing rapidly, but sad that I no longer find eating and food in general enjoyable."
	)

	dialogue_create(
	        "ask appetite",
	        choose("What can I do to increase your appetite?", "How may I help you improve your mood?", "Are you comfortable?"),
	        true,
	        d_ask_appetite
	)

	dialogue_create(
	        "ask craving",
	        choose("What would you like to have?", "May I fancy you with something to eat?"),
	        true,
	        d_ask_craving
	)



}
