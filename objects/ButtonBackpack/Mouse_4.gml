var __b__;
__b__ = action_if(visible);
if __b__
{
	audio_play_sound(sndBackpack,0, 0);
//global.last_room = room;
global.last_bg =  background_get();
//show_message(sprite_get_name(global.last_bg));
if (is_location()){
	room_persistent = true;	
}
room_goto(rmBackpack);

}
