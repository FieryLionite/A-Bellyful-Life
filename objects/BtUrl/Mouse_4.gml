if (in_dialogue())
	exit;

if (roomid != noone){
    custom_goto(roomid)
    }
else{
    url_open_ext(link, "_blank");//"_top");
}