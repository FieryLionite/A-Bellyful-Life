
#macro SKEW_ABSOLUTE 0 
#macro SKEW_PERCENT 1
function skew_init(type, xx, yy, spd, bothways){
	  counter= 0;
	
		skew_type = type;
		skew_xx = xx;
		skew_yy = yy;
		skew_x = 0;
		skew_y = 0;
		skew_x_dir = 0;
		skew_y_dir = 0;
		skew_spd = spd;
		skew_bothways = bothways;
		skew_xoffset = 0;
}

function skew_step(){
	if (! global.settings[? "Skew Animation"])
		return;
		
	if (skew_xx != 0)
	skew_x = cos(current_time/500  +skew_xoffset)*10;
	/*skew_dx = skew_spd;
	if (skew_x_dir != 0)
		skew_dx *= -1;
	
	skew_x += skew_dx;
	
	if (skew_x > skew_xx){
		skew_x_dir = 1;	
	}else {
		var tx = 0;
		if (skew_bothways)	
			tx = -skew_xx;
		if (skew_x < tx){
			skew_x_dir = 0;	
		}
	}*/
}

function skew_draw(sprite, subimg, xx,yy, xscale, yscale){
	//xscale *=1.5;
	//yscale *= 1.5;
	var x1,x2,y1,y2,x3,y3, x4, y4;
	xx -= sprite_get_xoffset(sprite);
	yy -= sprite_get_yoffset(sprite);
	
	x1 = xx + skew_x;
	y1 = yy + skew_y;
	
	x2 = xx + sprite_get_width(sprite)*xscale + skew_x;
	y2 = yy;
	
	x4= xx;
	y4 = yy + sprite_get_height(sprite)*yscale + skew_y;
	
	x3 = xx + sprite_get_width(sprite)*xscale;
	y3 = yy + sprite_get_height(sprite)*yscale;
	draw_sprite_pos_fixed2(sprite, subimg, x1, y1, x2, y2, x3, y3, x4, y4, image_alpha);
}

function skew_draw_other(other_id, sprite, subimg, xx,yy){
	xscale =1;
	yscale = 1;
	var x1,x2,y1,y2, x4, y4,
	skew_x = other_id.skew_x,
	skew_y = other_id.skew_y;
	
	xx -= sprite_get_xoffset(sprite);
	yy -= sprite_get_yoffset(sprite);
	
	x1 = xx + skew_x;
	y1 = yy + skew_y;
	
	x2 = xx + sprite_get_width(sprite)*xscale + skew_x;
	y2 = yy;
	
	x4= xx;
	y4 = yy + sprite_get_height(sprite)*yscale + skew_y;
	
	x3 = xx + sprite_get_width(sprite)*xscale;
	y3 = yy + sprite_get_height(sprite)*yscale;
	draw_sprite_pos_fixed2(sprite, subimg, x1, y1, x2, y2, x3, y3, x4, y4, image_alpha);
}

function skew_common(){
	skew_init(SKEW_ABSOLUTE, 8, 0, 0.2, true);
	skew_xoffset =random(6.28319);
}

function skew_none(){
	skew_init(SKEW_ABSOLUTE, 0, 0, 0, true);
}