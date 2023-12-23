if (point_distance(x,y,mouse_x, mouse_y) < 30){
	dragging = true;
	effect_create_above(ef_spark, ControlMassage.belly_x, ControlMassage.belly_y,0, c_aqua);
}