//target_room = rmMapUni;
target_script = function(){
	
	dialogue_init()
	dialogue_create("y", "Yes"	, true, function(){
		ButtonMap.last_map = rmMapUni;
		custom_goto(rmMapUni);	
		ControlEnv.go_resort = false;
		with (Character) go_resort = false;
	})
	dialogue_create("n", "No"	, true, function(){})
	dialogue_start(true);
	ctb_msg("Are you sure you want to return from your vacation early?");
	
	
	
}
name = "Return to City";
display = strlan(EN, name, RUS, "Назад в город ", JP, "シティに戻る", CN, "回城 ");
yy = -100;