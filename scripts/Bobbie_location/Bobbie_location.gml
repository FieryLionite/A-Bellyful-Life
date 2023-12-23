function Bobbie_location(){
	if (!Bobbie.met_player)
		return rmAlley;
	
	
	return schedule_get_location(
		   13, 17, rmAlley
		    //9,15,rmClassroomSci,
		    //19,24,rmAliceApartment
		    )
}