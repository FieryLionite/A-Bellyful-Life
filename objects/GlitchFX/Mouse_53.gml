if (point_distance(mouse_x, mouse_y, _ballPosition[0], _ballPosition[1] ) < 100){
	intro_DEB_portal();
	application_surface_draw_enable(true);
	instance_destroy();
}