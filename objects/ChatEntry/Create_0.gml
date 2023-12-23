//name = gen_name();

text = gen_name()+": " + gen_text();
padding = 5;
height = string_height(string_hash_to_newline(text)) + padding * 2;

x = room_width - CHAT_WIDTH;
y = room_height - height;

