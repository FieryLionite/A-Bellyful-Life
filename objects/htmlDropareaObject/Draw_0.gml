/// @description rendering files list and drop area

draw_self();
if (os_browser == browser_not_a_browser){
	sprite_index = winDropareaSprite;
	image_speed = 0;
	exit;
}

draw_set_halign(fa_left);
draw_set_valign(fa_left);
for(var i = 0; i < ds_list_size(files); i++) {
	draw_text(319, 32 + i * 25, files[| i]);
}