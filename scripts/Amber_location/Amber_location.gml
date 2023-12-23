function Amber_location(){
	return schedule_get_location(
		    6, 9,rmPark,
		    //9,15,rmClassroomSci,
		    //19,24,rmAliceApartment
		    )
}

function checkAmberEvent(){
	return (ControlEnv.hours < 8 &&
			(ControlEnv.hours < 7 || ControlEnv.minutes < 50) && // less than 7:50
			room == rmPark);
}