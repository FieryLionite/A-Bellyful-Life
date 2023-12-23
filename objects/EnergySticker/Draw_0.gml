draw_self();

if (target != noone){
	value = target.energy;//(target.energy/target.energy_max)*100
	color = make_color_rgb(255, 221, 140);
	draw_healthbar(x, y - 15, x+sprite_width-25, y + 15, value, c_white, color, color, 0, 0, 1);
}

draw_sprite(sprEnergySticker, 0, x,y);