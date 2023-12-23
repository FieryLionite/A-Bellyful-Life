function msg_drag_tutorial_EN(){
	ctb_list(noone,  noone, "(Open the Backpack and hold left click on the Keys, then drag them toward the Front Door to unlock it.)");
		//"This serves as a short tutorial to show you that you can use items this way",
		//"For example, you can give food and gifts to other characters by dragging the items outside from your backpack");
}

function msg_player_start_EN(){
	//ctb_list(noone, rmStartOutside , "You are "+Player.name+", a bubbly girl with lots of quirky desires.", " You just won a big lottery and is now moving out to rent your own mansion so you can do everything that you want!");
	ctb_list(noone, rmStartOutside , "After a long walk through town, you have finally made it to your new home.",
		"The size is daunting at first. It’s like a mansion compared to the room you had at your parents’ place.",
		"You examine the facade, a silly grin stretched across your face as you recall how you won ownership of your new pad.",
		"On a whim, you picked a lottery ticket up from a shop in your old neighborhood, and the grand prize was a brand-new home nestled between Downtown and the Shopping District.",
		"What would have cost you hundreds of thousands of dollars is now yours, rent-free.",
		"You eagerly reach into your bag for the front door key, excited to take your first real look at the place now that all of your stuff has been moved in.");
}

function msg_player_start_CN(){
	ctb_list(noone, rmBedroom , "你是"+Player.name+", 一个活泼的女孩，但心里有许多奇怪的癖好。","你刚刚通过彩票赢了很多钱，现在搬到了你自己的别墅里，想做什么都可以了！ ");
}

function msg_player_start_JP(){
	ctb_list(noone, rmBedroom , "あなたは "+Player.name+"、ちょっと特殊な趣味のある、陽気な女の子です。”,”宝くじに当選し、やりたいことを叶えるために自分の邸宅を購入し、引っ越ししています。");
}

function msg_player_start_RUS(){
	ctb_list(noone, rmBedroom , "Ты "+Player.name+", весёлая девушка, с множеством причудливых желаний.", " Ты только что выиграла в крупную лотерею и теперь собираешься арендовать собственный особняк, чтобы ты могла делать все, что захочешь");
}
////////

function msg_player_shower_EN(){
	var msg;
	if (Player.shower_times == 0)
		msg = "You can feel the refreshing water run through your body, restoring your energy and mood!";
	else if (Player.shower_times == 1)
		msg = "The cool water restored some of your energy and mood.";
	else if (Player.shower_times == 2)
		msg = "You let the chilly water wash over your body, but some of your fatigue remained.";
	else
		msg = "(You don't think you should take anymore showers today.)";
	ctb_list(player_shower_finish,noone , msg);
}

function msg_player_shower_CN(){
	var msg;
	if (Player.shower_times == 0)
		msg = "水流过你的身体，你感觉到清爽，你的能量和心情得到了恢复。";
	else if (Player.shower_times == 1)
		msg = "凉爽的水使得你的能量和心情得到回复。";
	else if (Player.shower_times == 2)
		msg = "你让冰凉的水流过你的身体，但是有一部分疲倦无法消除。";
	else
		msg = "(你觉得你今天不应该再洗澡了。)";
	ctb_list(player_shower_finish,noone , msg);
}

function msg_player_shower_JP(){
	var msg;
	if (Player.shower_times == 0)
		msg = "さわやかな水で体が洗い流され、体力と気分を回復させてくれるのを感じます！";
	else if (Player.shower_times == 1)
		msg = "冷たい水があなたの体力と気分の一部を回復させました。";
	else if (Player.shower_times == 2)
		msg = "冷たい水で体を洗い流したが、疲れの一部は残った。";
	else
		msg = "（今日はもうシャワーを浴びなくてもいいと思った。）";
	ctb_list(player_shower_finish,noone , msg);
}

function msg_player_shower_RUS(){
	var msg;
	if (Player.shower_times == 0)
		msg ="Ты можешь почувствовать, как освежающая вода течет по телу, восстанавливая энергию и настроение!";
	else if (Player.shower_times == 1)
		msg ="Прохладная вода вернула тебе немного энергии и настроения.";
	else if (Player.shower_times == 2)
		msg = "Ты позволяешь холодной воде омывать свое тело, но некоторая усталость осталась.";
	else
		msg =  "(Ты не думаешь, что тебе нужно больше принимать душ сегодня.)";
	ctb_list(player_shower_finish,noone , msg);
}

/////////////////////////

function msg_player_TV_EN(){
	var msg;
	if (Player.TV_times == 0)
		msg = "You eagerly watched all of your favorite shows, catching up from yesterday, restoring your energy and mood.";
	else if (Player.TV_times == 1 || Player.TV_times == 2)
		msg = "You searched around other channels to see if there are anything interesting. Perhaps sitting around watching TV all day isn't good.";
	else
		msg = "(You don't think you should watch anymore TV today.)";
	ctb_list(player_TV_finish, noone , msg);
}

function msg_player_TV_CN(){
	var msg;
	if (Player.TV_times == 0)
		msg = "你看着最喜欢的电视节目，恢复你的能量和心情。";
	else if (Player.TV_times == 1 || Player.TV_times == 2)
		msg = "你试着看其他频道是否令你感兴趣。也许坐着看一天电视不是很好。";
	else
		msg = "(你觉得你今天不应该再看电视了。)";
	ctb_list(player_TV_finish, noone , msg);
}

function msg_player_TV_JP(){
	var msg;
	if (Player.TV_times == 0)
		msg = "あなたは夢中で好きな番組をすべて見て、昨日の続きを確認し、体力と気分が回復しました。";
	else if (Player.TV_times == 1 || Player.TV_times == 2)
		msg = "あなたは何か面白いものはないかと、他のチャンネルを探し回りました。一日中ごろごろしてテレビを見ているのは良くないかもしれない。";
	else
		msg = "（今日はもうテレビを見ない方がいいと思った。）";
	ctb_list(player_TV_finish, noone , msg);
}

function msg_player_TV_RUS(){
	var msg;
	if (Player.TV_times == 0)
		msg = "Ты с удовольствием посмотрела все свои любимые шоу, наверстывая упущенное со вчерашнего дня, восстанавливая себе энергию и настроение.";
	else if (Player.TV_times == 1 || Player.TV_times == 2)
		msg = "Ты ищешь на других каналах, есть ли что-нибудь интересное. Возможно, сидеть и смотреть телевизор весь день - не лучшая идея.";
	else
		msg = "(Ты не думаешь, что сегодня тебе стоит больше смотреть телевизор.)";
	ctb_list(player_TV_finish, noone , msg);
}

///////////////////

function msg_player_jog_finish_EN(){
	var msg = "It was a light running session.", 
		msg2 = "You can feel your endurance improved a little bit",
		inc = global.player_increase_endurance,
		fraction =  (Player.total_content/Player.total_capacity);
	
	if (fraction > 0.8){
		msg = "It was extremely exhausting because you had to drag your very bloated belly through the park, but you did it!";
		msg2 = "Your endurance improved drastically.";
	}else if (fraction > 0.5){
		msg = "It was quite tiring because your belly was dragging you down.";
		msg2 = "Your endurance improved alot.";
	}else if (fraction > 0.2){
		msg = "It was more taxing than usual because of your bloated belly.";
		msg2 = "Your endurance improved slightly.";
	}
	
	msg2 += ". Max energy increased by " + string(inc*100) + " %";
	Player.energy_max += Player.energy_max * inc;
	ctb_list(noone,  global.last_room, msg, msg2);
}

function msg_player_jog_finish_CN(){
	var msg = "这一次跑步很轻松。", 
		msg2 = "你感受到你的忍耐力增加了一点",
		inc = global.player_increase_endurance,
		fraction =  (Player.total_content/Player.total_capacity);
	
	if (fraction > 0.8){
		msg = "因为你那肿大的肚子，跑步十分的累人，但是你做到了！";
		msg2 = "你的忍耐力增加了非常多。";
	}else if (fraction > 0.5){
		msg = "因为你肚子的重量一直向下拽着你，你感觉很累。";
		msg2 = "你的忍耐力增加了很多。";
	}else if (fraction > 0.2){
		msg = "因为你那肿大的肚子，跑步比平时更费神。";
		msg2 = "你的忍耐力增加了一些。"
	}
	
	msg2 += ". 最大能量增加了 " + string(inc*100) + " %";
	Player.energy_max += Player.energy_max * inc;
	ctb_list(noone,  global.last_room, msg, msg2);
}

function msg_player_jog_finish_JP(){
	var msg = "軽いランニングをしました。", 
		msg2 = "持久力が少し上がっていく気がします。",
		inc = global.player_increase_endurance,
		fraction =  (Player.total_content/Player.total_capacity);
	
	if (fraction > 0.8){
		msg = "大きく膨らんだお腹のまま歩き回ったため、いつもより疲れたけど、やり遂げました！";
		msg2 = "持久力が飛躍的に上がりました。";
	}else if (fraction > 0.5){
		msg = "お腹が膨らんでいて、すごく疲れました。";
		msg2 = "持久力が大幅に上がりました。";
	}else if (fraction > 0.2){
		msg = "お腹が膨らんでいたので、いつもより大変でした。";
		msg2 = "持久力が少し上がりました。";
	}
	
	msg2 += ". 最大体力が" + string(inc*100) + " %上がりました。";
	Player.energy_max += Player.energy_max * inc;
	ctb_list(noone,  global.last_room, msg, msg2);
}

function msg_player_jog_finish_RUS(){
	var msg = "Это была легкая тренировка.", 
		msg2 = "Ты чувствуешь, что твоя выносливость немного улучшилась",
		inc = global.player_increase_endurance,
		fraction =  (Player.total_content/Player.total_capacity);
	
	if (fraction > 0.8){
		msg = "Это было чрезвычайно утомительно, потому что тебе приходилось тащить свой очень раздутый живот по парку, но ты справилась!";
		msg2 = "Твоя выносливость улучшилась.";
	}else if (fraction > 0.5){
		msg = "Это было довольно утомительно, потому что живот тянул тебя вниз.";
		msg2 ="Твоя выносливость значительно улучшилась";
	}else if (fraction > 0.2){
		msg =  "Это было более утомительно, чем обычно, из-за твоего раздутого живота.";
		msg2 = "Твоя выносливость немного улучшилась.";
	}
	
	msg2 += "Твоя выносливость немного улучшилась. " + string(inc*100) + " %";
	Player.energy_max += Player.energy_max * inc;
	ctb_list(noone,  global.last_room, msg, msg2);
}

/////////////////////////////
function msg_player_swim_finish_EN(){
	var msg = "It was a light swimming session.", 
		msg2 = "You can feel your endurance improved a little bit",
		inc = global.player_increase_endurance,
		fraction =  (Player.total_content/Player.total_capacity);
	
	if (fraction > 0.8){
		msg = "It was extremely exhausting because you had to drag your very bloated belly through the pool, but you did it!";
		msg2 = "Your endurance improved drastically.";
	}else if (fraction > 0.5){
		msg = "It was quite tiring because your belly was dragging you down.";
		msg2 = "Your endurance improved alot.";
	}else if (fraction > 0.2){
		msg = "It was more taxing than usual because of your bloated belly.";
		msg2 = "Your endurance improved slightly.";
	}
	
	msg2 += ". Max energy increased by " + string(inc*100) + " %";
	Player.energy_max += Player.energy_max * inc;
	ctb_list(noone,  global.last_room, msg, msg2);
}

function msg_player_swim_finish_CN(){
	var msg = "这是一节轻松的游泳课。", 
		msg2 = "你的忍耐力增加了一点。",
		inc = global.player_increase_endurance,
		fraction =  (Player.total_content/Player.total_capacity);
	
	if (fraction > 0.8){
		msg = "拖着你超大的肚子游泳虽然很累，但是你做到了！";
		msg2 = "你的忍耐力增加了非常多。";
	}else if (fraction > 0.5){
		msg = "因为你肚子的重量一直向下拽着你，你感觉很累。";
		msg2 = "你的忍耐力增加了很多。";
	}else if (fraction > 0.2){
		msg = "因为你那肿大的肚子，游泳比平时更费神。";
		msg2 = "你的忍耐力增加了一些。";
	}
	
	msg2 += ". 最大能量增加了 " + string(inc*100) + " %";
	Player.energy_max += Player.energy_max * inc;
	ctb_list(noone,  global.last_room, msg, msg2);
}

function msg_player_swim_finish_JP(){
	var msg = "軽く泳ぎました。", 
		msg2 = "持久力が少し上がっていく気がします。",
		inc = global.player_increase_endurance,
		fraction =  (Player.total_content/Player.total_capacity);
	
	if (fraction > 0.8){
		msg = "大きく膨らんだお腹のまま泳いだため、とても疲れたけど、やり遂げました！";
		msg2 = "持久力が飛躍的に大幅に上がりました。";
	}else if (fraction > 0.5){
		msg = "お腹が膨らんでいて、すごく疲れました。";
		msg2 = "持久力が大幅に上がりました。";
	}else if (fraction > 0.2){
		msg = "お腹が膨らんでいたので、いつもより大変でした。";
		msg2 = "持久力が少し上がりました。";
	}
	
	msg2 += ". 最大体力が" + string(inc*100) + " %上がりました。";
	Player.energy_max += Player.energy_max * inc;
	ctb_list(noone,  global.last_room, msg, msg2);
}

function msg_player_swim_finish_RUS(){
	var msg = "Это было легкое плавание.",
		msg2 = "Ты можешь почувствовать, что выносливость немного улучшилась",
		inc = global.player_increase_endurance,
		fraction =  (Player.total_content/Player.total_capacity);
	
	if (fraction > 0.8){
		msg ="Это было чрезвычайно утомительно, потому что тебе приходилось тащить свой очень раздутый живот через бассейн, но ты сделала это!";
		msg2 = "Твоя выносливость улучшилась."
	}else if (fraction > 0.5){
		msg = "Это было довольно утомительно, потому что живот тащил всё время тебя вниз.";
		msg2 = "Твоя выносливость значительно улучшилась.";
	}else if (fraction > 0.2){
		msg = "Это было более утомительно, чем обычно, из-за твоего раздутого живота.";
		msg2 = "Твоя выносливость немного улучшилась.";
	}
	
	msg2 += "Твоя выносливость немного улучшилась. " + string(inc*100) + " %";
	Player.energy_max += Player.energy_max * inc;
	ctb_list(noone,  global.last_room, msg, msg2);
}