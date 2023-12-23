/// @description node_get(name)
/// @param name
function node_get(argument0) {
	for (var i = 0; i < instance_number(CheckPoint); i ++){
	    var node = instance_find(CheckPoint, i);
	    if (node.name == argument0)
	        return node;
	}

	return noone;



}
