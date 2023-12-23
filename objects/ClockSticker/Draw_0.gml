draw_self();

var hour_angle = (ControlEnv.hours/12)*360-90,
	min_angle = (ControlEnv.minutes*6) - 90;
	
draw_sprite_ext(sprClockHourHand, 0, x, y, 1, 1, -hour_angle, c_white, 1);
draw_sprite_ext(sprClockMinuteHand, 0, x, y, 1, 1, -min_angle, c_white, 1);

draw_set_color(c_black);
draw_set_font(fnt_popup);

hours = ControlEnv.hours;
minutes = ControlEnv.minutes;
day = ControlEnv.day;

hr = string(hours);
if (hours < 10)
    hr = "0" + hr;
min_str = string(minutes);
if (minutes < 10)
    min_str = "0" + min_str;
draw_text(x + 32,  y - sprite_yoffset + 12,  +  hr + ":" + min_str );
draw_text(x - sprite_xoffset + 10, y - sprite_yoffset + 12, get_day_str());