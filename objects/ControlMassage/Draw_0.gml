draw_sprite(sprShadow, 0, x, y);

/*if (irandom(90)==0){
	effect_create_above(ef_ellipse, mouth_x, mouth_y, 0, c_aqua);
	effect_create_above(ef_ellipse, belly_x, belly_y, 0, c_aqua);
}*/

draw_self();

draw_sprite(sprExpression, image_index, x, y);

draw_sprite_ext(sprPanelMassage, 0, 964, 2, 0.628, 0.628, 0, c_white, 1);
draw_sprite_ext(sprPanelInteractions, 0, 423, 610, 0.7958553, 0.7958553, 0, c_white, 1);

draw_healthbar(1107, 22, 1255, 46, char.lust, c_white, c_pink, c_pink, 0, 1, 1);
draw_healthbar(1107, 79, 1255, 105, char.stress, c_white, c_red, c_red, 0, 1, 1);

//--- Draw water surf
if (!surface_exists(surf))
    surf = surface_create(room_width, room_height);
    
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
for (var i=0; i<instance_number(o_liquid); i++){
   // with (o_liquid) draw_self();
   var l = instance_find(o_liquid, i);
   draw_set_color(l.color);
   draw_set_alpha(l.alarm[0]/100);
   //draw_rectangle(l.x - l.size, l.y - l.size, 
    //l.x + l.size,l.y+ l.size, false);
	draw_circle(l.x - l.size, l.y - l.size,l.size,0);
   draw_set_color(c_black);
}
draw_set_alpha(0.1);
surface_reset_target();

//shader_set_uniform_f(usize,1024,1024,4)//width,height,radius
shader_set(shader_liquid);
shader_set_uniform_f(usize,128,128,0.5)//width,height,radius
draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 0.5);
shader_reset();
draw_set_alpha(1);