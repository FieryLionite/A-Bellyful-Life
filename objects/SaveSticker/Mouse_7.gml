//json_decode(file_read_all(working_directory + "metadata.json"));

if !ready || in_dialogue() || (!instance_exists(ControlEnv) && !ds_map_exists(metadata, str(index)))
	exit;
	
dialogue_init()
	
	if (instance_exists(ControlEnv))
		dialogue_create(
		        "1",
		        strlan(EN, "Save", RUS, "Сохранить файл", JP, "ファイルを保存", CN, "保存存档"),
		        true,
		        save_action
		)
	
	if (ds_map_exists(metadata, str(index))){
		dialogue_create(
			        "2",
			        strlan(EN, "Load", RUS, "Загрузить игру", JP, "ゲームのロード", CN, "加载游戏"),
			        true,
			       load_action
		)
	
		dialogue_create(
			        "3",
			       strlan(EN, "Delete", RUS, "Удалить", JP, "消去", CN, "删除"),
			        true,
			       delete_action
		)
		
		dialogue_create(
			        "4",
			        strlan(EN, "Download", RUS, "Скачать", JP, "ダウンロード", CN, "下载"),
			        true,
			       download_action
		)
	}

	dialogue_start(true);
	
	with (SaveSticker) image_alpha = 0.5;
	image_alpha = 1;