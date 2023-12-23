function d_topics_common() {
	dialogue_init()
	var d = global.dialogues;
	var char = global.dialogue_char;

	dialogue_create(
	        "Health",
	        "You is your health?",
	        false,
	        "I'm fine"
	)

	dialogue_create(
	        "studies",
	        "How are your studies?",
	        false,
	        "I'm doing well in classes"
	)

	if (!char.has_number)
	dialogue_create(
	        "Number",
	        "May I have your number?",
	        true,
	        d_get_number
	)
	dialogue_start(true);



}
