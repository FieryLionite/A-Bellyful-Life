can_dismiss = false;

global.screen_lock = true;

///Change the look and feel

//items
//script_execute(global.patient.dialogue_script);
log = ds_map_create();
key = ds_map_find_first(global.dialogues);
item = global.dialogues[? key]
icon =  global.dialogies_icons[? key]

i = 0;
while (item != undefined){
    ds_map_add(log, i, item);
    add_dropdown_option(i, icon, item[0], noone, true);
    i ++;
    key = ds_map_find_next(global.dialogues, key);
    item = global.dialogues[? key]
}

//font
font = fnt_popup;

//size
total_width = 800;
item_padding = 20;       //space around each item
highlight_padding = 3;   //extra padding for highlight indicator
highlight_rad = 5;       //Radius for round rect highlight

//colors
bak_color = c_black;
border_color = c_black;
highlight_color = c_teal;
icon_color = c_ltgray;
separator_color = c_ltgray;
text_color = c_ltgray;

bak_alpha = .85;

///Built in variables, do not change
READY = false;
alarm[0] = 10;
num = array_length_1d(option_text);

x_offset = 0;
y_offset = 0;
selected = noone;

item_height = font_get_size(font)+item_padding*2;
icon_width = item_height-item_padding*2;

//calculate offsets to keep box on screen
total_height = item_height*num;


if(x < __view_get( e__VW.XView, 0 ))
{
    x_offset = __view_get( e__VW.XView, 0 )-x+1;
}
else if(x + total_width > __view_get( e__VW.XView, 0 )+__view_get( e__VW.WPort, 0 ))
{
    x_offset = (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ))-(x+total_width)+1;
}

if(y < __view_get( e__VW.YView, 0 ))
{
    y_offset = __view_get( e__VW.YView, 0 )-y+1;
}
else if(y + total_height > __view_get( e__VW.YView, 0 )+__view_get( e__VW.HPort, 0 ))
{
    y_offset = -total_height;
}

x1 = x+x_offset;
x2 = x+total_width+x_offset;
ty1 = y+y_offset;
ty2 = y+total_height+y_offset;
total_icon_size = (icon_width+item_padding*2);

