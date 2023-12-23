draw_self();
draw_healthbar(x,y, x+100, y+25, (ControlEnv.battery/(30*60*3))*100, c_black, c_yellow, c_yellow,
	0, 0, 1);