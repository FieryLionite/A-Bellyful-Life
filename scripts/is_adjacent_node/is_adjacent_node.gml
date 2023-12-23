/// @description is_adjacent_node(name)
/// @param name
function is_adjacent_node(argument0) {
	for (var i = 0; i < ds_list_size(nodes); i ++){
	    var node_name = nodes[| i];
	    if (node_name == argument0){
	        return true;
	    }
	}

	return false;



}
