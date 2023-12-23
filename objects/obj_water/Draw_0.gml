// colors in triangle gradient
var col1 = #9fc5e8;
var col2 = #0b5394;
	
draw_set_alpha(0.7);
for (var i = 0; i < columns; i++) {
	// set corner vars
    column_corners(i);

	// draw colored triangles to form trapezoids
    draw_triangle_color(x1, y1, x1, y2, x2, y2, col1, col2, col2, false);
    draw_triangle_color(x1, y1, x2, right_y1, x2, y2, col1, col1, col2, false);
}
draw_set_alpha(1);