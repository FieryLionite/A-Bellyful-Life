function mission_update_ui(argument0) {
	//mission_update_ui(stage)
	with (MockMissionButton) instance_destroy();
	var stage = global.mission_list[? string(argument0)];
	for (var i = 0; i < ds_list_size(stage); i ++){
	    var mission = stage[| i];
	    var button = instance_create(room_width, 219 + 70*i, MockMissionButton);
	    button.title = mission[? "title"];
	    button.target_room = mission[? "room"];
	}



}
