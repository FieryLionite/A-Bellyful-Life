stats = global.stats;
value = stats[? stat];
val_max = stats[? string(stat + "_max")];
draw_healthbar(x,y,x+150, y + 30, value/val_max*100, 
                c_black, c_aqua, c_aqua,0, true, true);

