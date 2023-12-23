global.mbelly_coords = {}
global.mmouth_coords = {}
global.mvag_coords = {}

function add_mbelly_coord(name,x,y){
	global.mbelly_coords[$ name] = {x:x, y:y};
}
function add_mmouth_coord(name,x,y){
	global.mmouth_coords[$ name] = {x:x, y:y};
}
function add_mvag_coord(name,x,y){
	global.mvag_coords[$ name] = {x:x, y:y};
}

function get_mbelly_coord(name){
	return global.mbelly_coords[$ name];
}
function get_mmouth_coord(name){
	return global.mmouth_coords[$ name];
}
function get_mvag_coord(name){
	return global.mvag_coords[$ name];
}

add_mbelly_coord("Amber", 468, 200);
add_mmouth_coord("Amber", 196, 213);
add_mvag_coord("Amber", 585, 182);

add_mbelly_coord("Aria", 459, 128);
add_mmouth_coord("Aria", 189, 125);
add_mvag_coord("Aria", 657, 136);

add_mbelly_coord("Aya", 475, 135);
add_mmouth_coord("Aya", 199, 152);
add_mvag_coord("Aya", 606, 147);

add_mbelly_coord("Bambi", 509, 278);
add_mmouth_coord("Bambi", 211, 289);
add_mvag_coord("Bambi", 649, 271);

add_mbelly_coord("Bobbie", 502, 291);
add_mmouth_coord("Bobbie", 234, 301);
add_mvag_coord("Bobbie", 649, 287);

add_mbelly_coord("DEB", 501, 171);
add_mmouth_coord("DEB", 216, 167);
add_mvag_coord("DEB", 635, 175);

add_mbelly_coord("Remi", 461, 162);
add_mmouth_coord("Remi", 162, 148);
add_mvag_coord("Remi", 591, 157);

add_mbelly_coord("Yumi", 468, 224);
add_mmouth_coord("Yumi", 177, 222);
add_mvag_coord("Yumi", 474, 219);