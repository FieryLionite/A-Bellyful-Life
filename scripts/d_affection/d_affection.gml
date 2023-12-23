function d_request(){
	dialogue_init();
	dialogue_create("1", 
		strlan(EN, "Cuddle Hug", RUS, "Обнимашки", JP, "カドルハグ", CN, "拥抱"),
		true,
		function(){
			if (global.dialogue_char.likability < 12){
				//ctb_msg("They avoided you as you approach, maybe you should get to know each other a little more.")	
				character_refuse_scene();
				splash_message("Failed likability check (>= 12)");
			}else{
				quick_scene_begin("Hug", function(){
						//with(Character) skew_none();
						global.show_follower = false;
						var char = global.dialogue_char;
						var msg = "";
						if (char.stomach_air > 30){
							msg += "(She makes a small burp ";
							with (char) do_burp();
						}
						if (char.bowels_air > 30){
							if (msg != "")
								msg = "(She makes a small burp, fart, ";
							else
								msg = "(She makes a small fart ";
							msg += ""
							with (char) do_fart();
						}
						if (msg != ""){
							msg += " and blushed in embarrasment)";
							
							if (!char.today_hug){
								char.desire_inflate += 3;
								char.libido += 4;
								var lustInc = (char.libido/100+1)*8;
								char.lust += lustInc;
								if (char.stress > 0)
									char.stress -= 4;
								ctb_msg(msg,"inflate desire +3, stress -4, libido +4, lust +" + string(lustInc));
							}else{
								ctb_msg(msg);
							}
							
						}else{
							if (!char.today_hug){
								char.libido += 2;
								var lustInc = (char.libido/100+1)*4;
								char.lust += lustInc;
								if (char.stress > 0)
									char.stress -= 4;
								ctb_msg("stress -4, libido +2, lust +" + string(lustInc));
							}
						}
						
						char.today_hug = true;
						
					}, [global.dialogue_char]);
			}
		}
	)
	dialogue_create("2", 
		strlan(EN, "Give a hickey", RUS, "Сделайте засос", JP, "キスマークをつける", CN, "留下吻痕"),
		true,
		function(){
			if (global.dialogue_char.likability + global.dialogue_char.lust < 30){
				//ctb_msg("They avoided you as you approach, maybe you should get to know each other a little more.")	
				character_refuse_scene();
				splash_message("Failed likability + lust check (>= 30)");
			}else{
					quick_scene_begin("Hickey", function(){
						//with(Character) skew_none();
						global.show_follower = false;
						var char =global.dialogue_char;
						if (!char.today_hickey){
							char.libido += 4;
							var lustInc = (char.libido/100+1)*8;
							char.lust += lustInc;
							if (char.stress > 0)
								char.stress -= 8;
							ctb_msg("stress -8, libido +4, lust +" + string(lustInc));
						}
						
						char.today_hickey = true;
					}, [global.dialogue_char]);
			}
							
		}
	)
	
	dialogue_create(
	            "3",
	            strlan(EN, "Ask to inflate her belly",RUS,"Попросите надуть ей живот",
					JP,"お腹を膨らませてもらう",CN,"お腹を膨らませてもらう"),//, RUS, "Действия", JP, "行動", CN, "行动"),
	            true,
	            //d_talk
				function(){
					if (global.dialogue_char.desire_inflate + global.dialogue_char.likability < 50){
						//ctb_msg("They avoided you as you approach, maybe you should get to know each other a little more.")	
						character_refuse_scene();
						splash_message("Failed inflate desire + likability check (must total >= 50)");
					}else{
							global.scene_script = character_insert;
							global.pump_bg = background_get();
							scene_start();
					}
							
				}
	    )	
	dialogue_start(true);
}