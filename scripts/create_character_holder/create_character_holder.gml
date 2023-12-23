function create_character_holder(argument0) {
	var char = argument0;
	var xx = 100;
	for (var i = 0; i < instance_number(CharacterHolder); i ++){
	    var holder = instance_find(CharacterHolder, i);
	    if (holder.x + holder.character.sprite_width > xx)
	        xx = holder.x + holder.character.sprite_width + 10;
	}
	var holder = instance_create(xx, room_height - 600, CharacterHolder);
	//show_message(str(xx) + ", " + char.name)
	holder.character = char;
	char.holder = holder;

	return holder;

}
