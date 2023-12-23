if (!ControlEnv.has_tripod){
		tooltip_start(x,y,"Error", 
		strlan(EN, "You need camera gear to start streaming!",
				CN, "您需要相机装备才能开始流媒体播放！",
				JP, "ストリーミングを開始するにはカメラギアが必要です！",
				RUS, "Вам нужно оборудование камеры, чтобы начать потоковое!"
			)
		);
		exit;
}

global.streaming = true;
instance_destroy();