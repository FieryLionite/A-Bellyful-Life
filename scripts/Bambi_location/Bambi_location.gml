function Bambi_location(){
	if (Bambi.met_player)
		return schedule_get_location(6,14, rmBarn);
	else
		return schedule_get_location(6,19, rmBarn);
}