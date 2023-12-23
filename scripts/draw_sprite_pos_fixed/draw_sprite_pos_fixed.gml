//#macro  draw_sprite_pos draw_sprite_pos_fixed2

global.sprite_caches = ds_map_create();
global.sprite_caches_queue = ds_queue_create();

//if sprite not in cache then put it in
function sprite_cache_update(spr_index, subimg){
	var key = str(spr_index)+"_"+str(subimg);
	if (!ds_map_exists(global.sprite_caches, key)){
		var width = sprite_get_width(spr_index), height = sprite_get_height(spr_index);
		var surface = surface_create(width, height);
		surface_set_target(surface);
		draw_sprite(spr_index, subimg, 0,0);
		surface_reset_target();
		var sprite = sprite_create_from_surface(surface, 0,0, width, height, false, false, 0, 0);
		surface_free(surface);
		global.sprite_caches[? key] = sprite;
		ds_queue_enqueue(global.sprite_caches_queue, key);
		
		if (ds_queue_size(global.sprite_caches_queue) > 5){
			var to_delete = ds_queue_dequeue(global.sprite_caches_queue);
			sprite_delete(global.sprite_caches[? to_delete]);
			ds_map_delete(global.sprite_caches, to_delete);
		}
	}
	
	return global.sprite_caches[? key];
}

function draw_sprite_pos_fixed2(sprite, subimg, x1,	y1, x2, y2, x3, y3, x4, y4, alpha){
	//sprite=sprite_cache_update(sprite, subimg);
	//draw_sprite_pos(sprite, 0, x1,	y1, x2, y2, x3, y3, x4, y4, alpha);	
	draw_sprite_pos(sprite, subimg, x1,	y1, x2, y2, x3, y3, x4, y4, alpha);	
}

/// @description  draw_sprite_pos_fixed(sprite,subimg,x1,y1,x2,y2,x3,y3,x4,y4,colour,alpha);
/// @param sprite
/// @param subimg
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3
/// @param x4
/// @param y4
/// @param colour
/// @param alpha
function draw_sprite_pos_fixed(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {

	var sprite, subimg, colour, alpha, texture, uvs, px, py, ax, ay, bx, by, cx, cy, s, t, q, can, v_buffer;

	sprite = argument0;
	subimg = argument1;
	colour = argument10;
	alpha = argument11;
	if (is_undefined(alpha)){ //using legacy draw_set_pos arguments that doesnt have colour
		colour = c_white;
		alpha = argument10;
	}
	
	//texture = sprite_get_texture(sprite, subimg);
	//uvs = sprite_get_uvs(sprite, subimg);
	sprite = sprite_cache_update(sprite,subimg);
	texture = sprite_get_texture(sprite, 0);
	uvs = sprite_get_uvs(sprite, 0);

	px[0] = argument8;
	py[0] = argument9;
	px[1] = argument6;
	py[1] = argument7;
	px[2] = argument4;
	py[2] = argument5;
	px[3] = argument2;
	py[3] = argument3;

	ax = px[2] - px[0];
	ay = py[2] - py[0];
	bx = px[3] - px[1];
	by = py[3] - py[1];

	can = ax * by - ay * bx;

	if (can != 0) {
	  cx = px[0] - px[1];
	  cy = py[0] - py[1];  
	  s = (ax * cy - ay * cx) / can;  
	  if (s > 0 and s < 1) {
	    t = (bx * cy - by * cx) / can;    
	    if (t > 0 and t < 1) {
	      q[0] = 1 / (1 - t);
	      q[1] = 1 / (1 - s);
	      q[2] = 1 / t;
	      q[3] = 1 / s;
	      v_buffer = vertex_create_buffer();
	      vertex_begin(v_buffer, global.format_perspective);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, px[3], py[3]);
	      vertex_normal(v_buffer, q[3]*uvs[0], q[3]*uvs[1], q[3]);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, px[2], py[2]);
	      vertex_normal(v_buffer, q[2]*uvs[2], q[2]*uvs[1], q[2]);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, px[0], py[0]);
	      vertex_normal(v_buffer, q[0]*uvs[0], q[0]*uvs[3], q[0]);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, px[1], py[1]);
	      vertex_normal(v_buffer, q[1]*uvs[2], q[1]*uvs[3], q[1]);
	      vertex_end(v_buffer);
	      shader_set(sh_perspective);
	      vertex_submit(v_buffer, pr_trianglestrip, texture);
	      shader_reset();
	      vertex_delete_buffer(v_buffer);
	    }
	  }
	}



}
