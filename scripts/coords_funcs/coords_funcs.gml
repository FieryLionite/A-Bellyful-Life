function coords_inflate_add_scene(scene_name, char,  entry_x, entry_y, scale=1, item_x=-1){
	
	if (!variable_struct_exists(global.inflate_coords, scene_name)){
			global.inflate_coords[$ scene_name] = {};
	}
	
	global.inflate_coords[$ scene_name][$ object_get_name(char)] = {
			entry_x: entry_x,
			entry_y: entry_y,
			scale:scale,
			item_x: item_x
	};
}

function coords_belly_add_scene(scene_name, char,  belly_x, belly_y){
	
	if (!variable_struct_exists(global.belly_coords, scene_name)){
			global.belly_coords[$ scene_name] = {};
	}
	
	global.belly_coords[$ scene_name][$ object_get_name(char)] = {
			belly_x: belly_x,
			belly_y: belly_y
	};
}

function coords_feed_add(scene_name,char, feed_x, feed_y){
	if (!variable_struct_exists(global.feed_coords, scene_name)){
			global.feed_coords[$ scene_name] = {};
	}
	
	global.feed_coords[$ scene_name] [$ object_get_name(char)] = {
		feed_x:feed_x,
		feed_y:feed_y
	}
}

function coords_feed_get(scene_name, charIdx){
	var cname =  object_get_name(charIdx);
	if (!variable_struct_exists(global.feed_coords, scene_name) or 
		!variable_struct_exists(global.feed_coords[$ scene_name], cname) ){
			return noone;	
		}
		
		return global.feed_coords[$ scene_name][$ cname];
}

function coords_inflate_get(scene_name, charIdx){
	var cname =  object_get_name(charIdx);
	if (!variable_struct_exists(global.inflate_coords, scene_name) or 
		!variable_struct_exists(global.inflate_coords[$ scene_name], cname) ){
			return noone;	
		}
		
		return global.inflate_coords[$ scene_name][$ cname];
}

function coords_belly_get(scene_name, charIdx){
	var cname =  object_get_name(charIdx);
	if (!variable_struct_exists(global.belly_coords, scene_name) or 
		!variable_struct_exists(global.belly_coords[$ scene_name], cname) ){
			return noone;	
		}
		
		return global.belly_coords[$ scene_name][$ cname];
}

function coords_breast_set(charIdx, x1,y1,x2,y2,x3,y3){
	var cname =  object_get_name(charIdx);
	global.breast_coords[$ cname] = {
		x1:x1,
		y1:y1,
		x2:x2,
		y2:y2,
		x3:x3,
		y3:y3
	}
}

function coords_breast_get(charIdx){
	var cname =  object_get_name(charIdx);
	return global.breast_coords[$ cname];
}
global.inflate_coords = {}
global.feed_coords = {}
global.breast_coords = {}
global.belly_coords = {}

