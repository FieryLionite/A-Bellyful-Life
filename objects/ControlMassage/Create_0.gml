global.last_room = rmMassage;

x = 0;
y = room_height*0.4;

lustInc = 0;
undressed = false;

//girl = global.massage_girl;
//var name = object_get_name(girl.object_index);
//name = "Amber";
char = global.char_massage;
//bonus stuffing
//char.desire_stuffing += 100;
org_desire_stuffing = char.desire_stuffing;

name = object_get_name(char.object_index);

sprite_index = asset_get_index("spr"+name+"_Massage_0");
sprExpression = asset_get_index("spr"+name+"_MassageEx_0");
sprShadow = asset_get_index("spr"+name+"_MassageS_0");
//init blockages

image_speed = 0

var bcoords = coords_belly_get("Massage", char.object_index);
var mcoords = coords_feed_get("Massage", char.object_index);

belly_x = x - sprite_xoffset + bcoords.belly_x;
belly_y = y - sprite_yoffset + bcoords.belly_y;

mouth_x = x - sprite_xoffset + mcoords.feed_x;
mouth_y = y - sprite_yoffset + mcoords.feed_y;

//--- Shader init
surf = noone;//surface_create(room_width, room_height);
usize = shader_get_uniform(shader_liquid,"size");//uniform for width, height, radius