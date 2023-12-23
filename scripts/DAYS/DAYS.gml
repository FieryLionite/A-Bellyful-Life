#macro MON 0
#macro TUE 1
#macro WED 2
#macro THU 3
#macro FRI 4
#macro SAT 5
#macro SUN 6

function get_day_str() {
	switch (day%7){
	    case 0:
	        return "Mon";
	    case 1:
	        return "Tue";
	    case 2:
	        return "Wed";
	    case 3:
	        return "Thu";
	    case 4:
	        return "Fri";
	    case 5:
	        return "Sat";
	    case 6:
	        return "Sun";
	}



}
