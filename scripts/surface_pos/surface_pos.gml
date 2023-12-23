function draw_surface_pos(surf, _x0, _y0, _x1, _y1, _x2, _y2, _x3, _y3) {	
	var tex = surface_get_texture(surf);
	draw_primitive_begin_texture(pr_trianglestrip , tex);
    
	draw_vertex_texture(_x0, _y0, 0, 0);
    draw_vertex_texture(_x1, _y1, 1, 0);
    draw_vertex_texture(_x2, _y2, 1, 1);
    draw_vertex_texture(_x3, _y3, 0, 1);
	draw_vertex_texture(_x0, _y0, 0, 0);
    
    draw_primitive_end();
}

function skew_draw_surface(surf, xx, yy, xscale = 1, yscale = 1){
	var x1,x2,y1,y2,x3,y3, x4, y4;
	//xx -= sprite_get_xoffset(sprite);
	//yy -= sprite_get_yoffset(sprite);
	
	x1 = xx + skew_x;
	y1 = yy + skew_y;
	
	x2 = xx + surface_get_width(surf)*xscale + skew_x;
	y2 = yy;
	
	x4= xx;
	y4 = yy + surface_get_height(surf)*yscale + skew_y;
	
	x3 = xx + surface_get_width(surf)*xscale;
	y3 = yy + surface_get_height(surf)*yscale;
	draw_surface_pos(surf,x1, y1, x2, y2, x3, y3, x4, y4);
}