//if (!visible)
if not (global.scene_interface && StickerEye.image_index && !instance_exists(obj_textbox))
	exit;
	
tooltip_start(x,y-350, 
	strlan(EN, "Inflating", 
		CN, "腹胀胃",
		JP, "膨らませる",
		RUS, "Надувание"
	),strlan(
	EN, "This dial represents the pressure build up (not your actual capacity!). If the dial passes the red then you won't be able to hold it in. To reduce pressure, simply let some time pass and inflate again.\n  To increase max capacity, simply keep yourself inflated as long as possible.",
	CN, "这个指针代表着压力的大小(不是你的实际容量！)'如果指针指了红线，你就会承受不了。如果想要减小压力，使时间经过后重新充入。如果想增大你的最大容量，在一天中尽量长时间地保持身体充满的状态。",
	JP, "このダイヤルは胃もしくは腸内の圧力の上昇を表します。（実際の容量ではなく、あくまでミニゲーム中での圧力ゲージです。）ダイヤルが赤い圧力ゲージを超えると我慢できなくなります。圧力を下げるには、単純にしばらく時間を経過させ、再び膨らませてください。\n 最大容量を増やすには、出来るだけ長い間お腹を膨らませたままにしてください。",
	RUS, "Эта шкала показывает рост давления (а не твою фактическую вместимость!). Если стрелка проходит мимо красного цвета, ты не сможешь его удержать. Чтобы уменьшить давление, просто сделай перерыв и надуйся снова.\n Чтобы увеличить максимальную вместимость, просто держи живот раздутым как можно дольше."
	)
)