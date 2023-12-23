// Inherit the parent event
event_inherited();

if (just_rescued && room == rmPool){

		exelan("msg_Aria_rescue");
		
		just_rescued = false;
		has_number = true;
		likability = 5;
}

if (!finished_intro && Player.pool_pass > 0){
		global.scene_script = aria_intro_scene;
		scene_start();
		exit;
}

if (!finished_intro || Player.pool_pass <= 0 || room == rmScene)
	return;

//show_message("JERE")
notify_time(7, 0, 35, "Aria's swim practice", rmPool, "Pool");

if (checkAriaEvent() && finished_intro){
	if (practice  < 2){
		
		global.scene_script = aria_practice_scene;
		scene_start();
	}else if (!finished_intro_pump){
		practice =  3;
		/*if  (has_item(IPump)){
			finished_intro_pump = true;
			global.scene_script = aria_intro_pump;
		}else
			global.scene_script = aria_practice_scene;
		scene_start();*/
		
		if (!has_item(IPump)){
			//prevent message lock
			if (!instance_exists(obj_textbox)){
				global.scene_script = aria_practice_scene;
				msg = strlan(EN,"(You'll need a hand pump to execute your idea, come back next time with a hand pump!)",
										RUS, "(Тебе понадобится ручной насос, чтобы воплотить в жизнь свою идею, возвращайся в следующий раз с ручным насосом!)",
										JP,"（あなたのアイデアを実行するにはハンドポンプが必要です。次回はハンドポンプを持って戻ってきてください！）",
										CN, "(你需要一个泵才能实现，下次来的时候记得带一个泵！)"
									);	
				ctb_list(scene_start, noone, msg);
			}
		}else{
			global.scene_script = aria_intro_pump;
			scene_start();
		}
		
	}else{
		if (!finished_pump){
			global.scene_script = aria_pump;
			scene_start();
		}else{
			global.scene_script = aria_practice_scene;
			scene_start();
		}
	
	}
}