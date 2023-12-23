function check_day(){
	for (var i=0; i<argument_count; i ++)
		if (argument[i] == ControlEnv.day % 7)
			return true;
	
	return false;
}

function notify_time(hour, minutes,  minutes_before, event_name, event_room, event_location){
	if( (!check_time(hour, minutes, minutes_before) && room != rmJournal) || room == event_room)
		return false;
	
	sticker = NotificationSticker;
	
	if (room == rmJournal){
		if (ControlEnv.room_counter < 1)
			sticker = ScheduleSticker;//instance_create(0,0, ScheduleSticker);
		else return false;
	}
	//else
		//show_message("YES!");
		
	//LOL
	global.temp = event_name;
	with (sticker) {
		if (event_name == global.temp && room != rmJournal)
			global.temp = true;
	}
	
	if (global.temp == true)
		return true;
	
	var sticker = instance_create_depth(0, 60, 0,sticker);
	sticker.event_name = event_name;
	sticker.event_room = event_room;
	sticker.event_location = event_location;
	sticker.event_start_hour = hour;
	sticker.event_start_minute = minutes;
	return true;
}

function check_time( hour, minutes,  minutes_before){
	var date_target = date_create_datetime( 2011, 1, 1, hour, minutes, 0 );
	var dateCurrent = date_create_datetime( 2011, 1, 1, ControlEnv.hours,ControlEnv.minutes, 0 );
	
		if ( date_compare_time(dateCurrent, date_target)< 1 &&
			date_minute_span(dateCurrent, date_target)<minutes_before)
			return true;
		return false;
}

function get_minutes_span(hour, minutes, hour2, minutes2){
		var date_target = date_create_datetime( 2011, 1, 1, hour, minutes, 0 );
	var dateCurrent = date_create_datetime( 2011, 1, 1,hour2,minutes2, 0 );
	
	return date_minute_span(dateCurrent, date_target);
}