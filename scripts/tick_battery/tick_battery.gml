function tick_battery(minutes){
	if (charging){
			batteries += minutes;
			if (batteries > batteries_cap)
				batteries = batteries_cap;
	}
}