text = strlan(EN, "Quit Game", RUS, "Выйти из игры", JP, "試合終了", CN, "退出游戏");
script = function(){
	dialogue_init()
	dialogue_create("y", "Yes"	, true, function(){game_end();})
	dialogue_create("n", "No"	, true, function(){})
	dialogue_start(true).bak_alpha = 1;;
	ctb_msg(
		strlan(EN, "Are you sure? Unsaved progress will be lost!",
			RUS, "Вы уверены? Несохраненный прогресс будет потерян!",
			JP, "本当ですか？保存されていない進行状況は失われます！",
			CN, "你确定吗？未保存的进度将丢失！")
	)
}

sprite_index = sprSettingButtonStickerRed;