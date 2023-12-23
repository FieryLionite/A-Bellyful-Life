function msg_Aria_eating_out_EN(){
ctb_msg(
		cmd_speaker(Aria)+
		cmd_ex(ex_talk)+cmd_sound(get_random_asset("chewsoft", 1,4))+"...",
		cmd_ex(ex_smile2)+cmd_sound(get_random_asset("drink", 1,4))+"...",
		cmd_ex(ex_smile)+cmd_sound(get_random_asset("chewsoft", 1,4))+
		"So delicious![ex:idle]",
		"[speaker:Player](You could only gawk as Aria rapidly chomp down her food. You had to remind her multiple times to slow down to avoid choking)",
		"[speaker:Aria][ex:blush]Sorry! It's just that ever since you helped me, my swimming sessions have gone so well and somehow I'd feel an insatiable hunger for the rest of the day.",
		"[ex:idle][speaker:Player](You concluded that perhaps her metabolism had changed after many intensive swim sessions)."
		//cmd_speaker(
	)
}

function msg_Aria_eating_out_RUS(){
ctb_msg(
		cmd_speaker(Aria)+
		cmd_ex(ex_talk)+cmd_sound(get_random_asset("chewsoft", 1,4))+"...",
		cmd_ex(ex_smile2)+cmd_sound(get_random_asset("drink", 1,4))+"...",
		cmd_ex(ex_smile)+cmd_sound(get_random_asset("chewsoft", 1,4))+
		"Вкуснятина![ex:idle]",
	"[speaker:Player](Ты только и могла таращиться, пока Ария быстро поедала свою еду. Тебе приходилось несколько раз напоминать ей, чтобы она сбавляла скорость, чтобы не задохнуться)",
	"[speaker:Aria][ex:blush]Сорян! Просто с тех пор, как ты мне помогла, мои занятия плаванием прошли так хорошо, что я почему-то чувствовала ненасытный голод до конца дня.",
	"[ex:idle][speaker:Player](Ты пришла к выводу, что, возможно, ее метаболизм изменился после многих интенсивных занятий плаванием)."
		//cmd_speaker(
	)
}

function msg_Aria_eating_out_CN(){
ctb_msg(
		cmd_speaker(Aria)+
		cmd_ex(ex_talk)+cmd_sound(get_random_asset("chewsoft", 1,4))+"...",
		cmd_ex(ex_smile2)+cmd_sound(get_random_asset("drink", 1,4))+"...",
		cmd_ex(ex_smile)+cmd_sound(get_random_asset("chewsoft", 1,4))+
		"真好吃啊[ex:idle]",
		"[speaker:Player](Aria狼吞虎咽的样子让你看入了神。你不时地提醒她吃慢一点，不要噎着。)",
		"[speaker:Aria][ex:blush]抱歉！只是自从你帮我以来，我的游泳课进展地特别顺利，然后一天我都感觉特别的饿，不知道为什么。",
		"[ex:idle][speaker:Player](你感觉到她经历过这么多且密集的游泳课后，她的新陈代谢产生了变化)。"
		//cmd_speaker(
	)
}

function msg_Aria_practice_EN(){
	var msg = "", msg2 = "", msg3 = "";
	if (Aria.practice == 1){
		msg = "Your first swim practice with Aria went well. Aria is doing her best. Her movements and form is correct, but somehow she is still having great difficulty at keeping herself afloat.";	
	}else if (Aria.practice == 2){
		msg = "Aria followed your instructions carefully, her swim movements are almost perfect. Yet somehow she can't stay afloat. As if gravity itself wants to pull her down!";	
		msg2 = "It looks like Aria might need to use a swim float at all times, which frustrates you both. Then you had an idea, why not make Aria herself a float? You wonder if she would go along with your plan.";
		msg3 = "(You'll need a hand pump to execute your idea, come back next time with a hand pump!)"
	}else if (Aria.bowels_content < 950){
		msg = "Swiming on an empty stomach, the results were not as desired. Aria was able to practice her swim form, but she'll sink quickly when left alone.";	
	}else  if (Aria.bowels_content < 1400){
		msg = "Both you and Aria could visibly observe major improvements. Aria doesn't seem to immediately sink when you let go anymore";	
		msg2 = "Although she would eventually get pulled to the bottom of the pool when left swiming in a straight line for a while."
		msg3 = "You can't help but imagine the better results if Aria is inflated even more."
	}else {
		msg = "The swim practice went great! There wasn't a moment when Aria wasn't afloat. She could do whatever she wanted, swim in whatever form she likes"
		msg2 = "Aria doesn't even seem to mind her large bloated belly at all and happily swimed everywhere. You can see a happy smile plastered on her face the entire time.";	
	}
	
	if (msg2 == "")
		ctb_list(noone, rmPool , msg);
	else
		ctb_list(noone, rmPool , msg, msg2, msg3);
}

function msg_Aria_practice_RUS(){
	var msg = "", msg2 = "", msg3 = "";
	if (Aria.practice == 1){
		msg =  "Ваше первое занятие плаванием прошло очень хорошо. Ария делала, всё что в её силах. Её движения и техника правильные, но ей почему-то всё ещё трудно удержаться на плаву.";	
	}else if (Aria.practice == 2){
	msg = "Ария тщательно следовала твоим инструкциям, ее движения почти идеальны. Но почему-то она не может оставаться на плаву. Как будто сама гравитация хочет ее сбить!";	
	msg2 = "Похоже, Арии, потребуется проводить всё время в бассейне, что расстраивает вас обоих. Тогда у тебя возникла идея, почему бы не сделать саму Арию поплавком? Ты задаёшься вопросом, согласится ли она с вашим планом.";
	msg3 = "(Тебе понадобится ручной насос, чтобы воплотить в жизнь свою идею, возвращайся в следующий раз с ручным насосом!)";
	}else if (Aria.bowels_content < 950){
		msg = "Плавание с пустым животом не принесло желаемых результатов. Ария смогла отработать свою технику плавания, но она быстро утонет, если останется одна.";	
	}else  if (Aria.bowels_content < 1400){
		msg = "И ты, и Ария заметили значительные улучшения. Ария, кажется, не сразу тонет, когда ты её отпускаешь";	
		msg2 ="Хотя в конечном итоге её тянуло ко дну бассейна, если оставлять ее некоторое время плавать по прямой."
		msg3 = "Ты даже и не можешь представить, каких результатов добьётся Ария, если раздуется ещё больше"
	}else {
		msg =  "Практика плавания прошла отлично! Не было момента, чтобы Ария не была на плаву. Она могла делать все, что хотела, плавать в любой форме, какой ей нравится"
		msg2 = "Ария, кажется, даже не обращает внимания на свой огромный раздутый живот и радостно плавает повсюду. Ты можешь видеть счастливую улыбку на ее лице все время.";
	}
	
	if (msg2 == "")
		ctb_list(noone, rmPool , msg);
	else
		ctb_list(noone, rmPool , msg, msg2, msg3);
}

function msg_Aria_practice_CN(){
	var msg = "", msg2 = "", msg3 = "";
	if (Aria.practice == 1){
		msg =  "你和Aria的第一次游泳练习进展得不错。Aria尽了全力，她的动作和姿势是正确的，但是她很难保持漂浮在水上。";
	}else if (Aria.practice == 2){
	msg = "Aria小心地听从着你的指导，她的泳姿几乎是完美的。但是她仍然不能保持漂浮，好像重力一定要将她拽入水中一样。";
	msg2 = "看起来Aria可能用几次游泳圈，这让你们都感觉很苦恼。但是你想到了一个方法：为什么不能让Aria自己浮起来？你不知道她会不会同意你这个计划。";
	msg3 = "(你需要一个泵才能实现，下次来的时候记得带一个泵！)";
	}else if (Aria.bowels_content < 950){
		msg = "因为她的肚子是平平的，Aria还是没能学会游泳。她可以做出正确的泳姿，但是一个人入水时，立刻就沉下去了。";
	}else  if (Aria.bowels_content < 1400){
		msg = "你和Aria都能看到她产生的进步。当她一个人游时，她不会立刻沉下去了。";
		msg2 = "尽管她可以一个人直线游到泳池对面.";
		msg3 = "你不禁开始想象，把Aria肚子充气变得更大时的模样。";
	}else {
		msg = "游泳练习十分顺利地进行了！Aria一直能够保持漂浮。不论什么泳姿，她都可以做到了。";
		msg2 = "Aria一点也不在意自己的大肚子里装满了空气，开心地游着泳。整个游泳课下来她都十分的开心。";
	}
	
	if (msg2 == "")
		ctb_list(noone, rmPool , msg);
	else
		ctb_list(noone, rmPool , msg, msg2, msg3);
}

function msg_Aria_practice_JP(){
	var msg = "", msg2 = "", msg3 = "";
	if (Aria.practice == 1){
		msg =   "Aria との初めてのレッスンはうまくいきました。Aria は頑張っています。泳ぎ方やフォームは正しいのに、なぜか浮くことがとても難しいようです。";
	}else if (Aria.practice == 2){
	msg = "Aria はあなたの指示をしっかり聞いて、泳ぎ方はほとんど完璧です。しかし、なぜか浮くことができません。まるで重力が彼女を引きずり降ろしているかのように！";	
	msg2 = "Aria はいつも浮き輪を必要そうで、二人ともイライラします。そこであなたはAria 自身を浮き輪にするアイデアを考えました。彼女はその計画に賛成してくれるでしょうか。";
	msg3 = "（アイデアを実行するにはハンドポンプが必要です。次回はハンドポンプを持って来てください！）";
	}else if (Aria.bowels_content < 950){
		msg = "空っぽのお腹で泳いでも、思うように結果が出ませんでした。Aria は泳ぎのフォームを練習できましたが、放っておくとすぐに沈んでしまいます。";
	}else  if (Aria.bowels_content < 1400){
		msg ="あなたも Aria も、目に見えて大きな改善が見られました。もう手を放しても Aria はすぐには沈みません。";	
		msg2 ="とはいっても、しばらく一人で真っすぐ泳いでいると、やがてプールの底に引きずり込まれてしまいます。"
		msg3="Aria をもっと膨らませた方が良い結果になるのではないかと想像せざるをえません。"

	}else {
		msg =  "水泳のレッスンはとてもうまくいきました！ Aria が浮いていない瞬間はありませんでした。彼女は好きなことをして、好きなフォームで泳ぐことができました。";
		msg2= "Aria は大きく膨らんだお腹も全く気にしていないようで、どこまでも楽しそうに泳いでいました。彼女の顔には幸せな笑顔がずっと満ちあふれていました。";
	}
	
	if (msg2 == "")
		ctb_list(noone, rmPool , msg);
	else
		ctb_list(noone, rmPool , msg, msg2, msg3);
}
/////////////////////
function msg_Aria_first_pump_EN(){
	msg = "[set_speaker:Player] I have an idea on how to keep you floating without using a float, so you can swim as much as you want without sinking! Although you might find it a little ... strange";
	msg2 = "[set_speaker:Aria] Please! I don't mind it as long as I am able to swim on my own. Please tell me your idea!"
	msg3 = "[set_speaker:Player] You began explaining to Aria on how to use the hand pump to turn herself into a large float, while ignoring her major blushing episode."
	ctb_list(noone, rmPool , msg, msg2, msg3);
}

function msg_Aria_first_pump_RUS(){
	msg = "[set_speaker:Player] У меня есть идея, как удержать тебя на плаву, не используя поплавок, чтобы ты могла плавать сколько угодно, не утонув! Хотя это может показаться немного ... странным";
	msg2 = "[set_speaker:Aria] Пожалуйста! Я не представляю как долго буду учиться самостоятельно плавать. Расскажи, пожалуйста, свою идею!"
	msg3 = "[set_speaker:Player] Ты начала объяснять Арии, как использовать ручной насос, чтобы превратиться в большой поплавок, игнорируя при этом ее смущение."
	ctb_list(noone, rmPool , msg, msg2, msg3);
}

function msg_Aria_first_pump_CN(){
	msg = "[set_speaker:Player] 我知道怎么让你不用游泳圈就能漂浮起来了，只不过你可能会觉得有一点点奇怪……";
	msg2 = "[set_speaker:Aria]求求你！只要我能学会游泳，我什么都会做的！";
	msg3 = "[set_speaker:Player] 你开始向Aria解释怎么用泵将她自己变成一个'浮板'，听着听着Aria便害羞了，脸颊发红。";
	ctb_list(noone, rmPool , msg, msg2, msg3);
}

function msg_Aria_first_pump_JP(){
	msg ="[set_speaker:Player] 浮き輪を使わずに体を浮かせて、沈まずに好きなだけ泳げる方法を考えたよ！ちょっとだけ...変な感じがするかも。";
	msg2="[set_speaker:Aria]おねがいです！ 泳げるようになるなら気にしません...教えてください！";
	msg3="[set_speaker:Player] Aria が顔を真っ赤にして恥ずかしがるのを無視して、ハンドポンプを使って自分を大きな浮き輪にする方法を説明し始めました。";
	ctb_list(noone, rmPool , msg, msg2, msg3);
}


///////////////////

function msg_Aria_after_first_pump_EN(){
	ctb_msg( // after first water inflation
		"[speaker:Aria][ex:ex_blush]Wow...",
		"[speaker:Player] So, how was that?",
		"[speaker:Aria][ex:ex_blush][sound:belly_slosh] It's so sloshy, could I use this to help with my swim lessons?",
		"[speaker:Player] I don't think s-",
		"[speaker:Aria][ex:ex_smile]",
		"[speaker:Player] uh, yeah it should work",)	
}

function msg_Aria_after_first_pump_RUS(){
	ctb_msg( // after first water inflation
		"[speaker:Aria][ex:ex_blush]Вау...",
		"[speaker:Player] Итак, как это было?",
		"[speaker:Aria][ex:ex_blush][sound:belly_slosh] Это было необычно, сможет ли мне это помочь с уроками плавания?",
		"[speaker:Player] Ну не зна-",
		"[speaker:Aria][ex:ex_smile]",
		"[speaker:Player] Да, это должно сработать")	
}

function msg_Aria_after_first_pump_CN(){
	ctb_msg( // after first water inflation
		"[speaker:Aria][ex:ex_blush]哇哦……",
		"[speaker:Player]感觉怎么样？",
		"[speaker:Aria][ex:ex_blush][sound:belly_slosh]感觉我的肚子好晃呀，真的会对我的游泳产生帮助么？",
		"[speaker:Player]我觉得……",
		"[speaker:Aria][ex:ex_smile]",
		"[speaker:Player] 嗯，会有作用的。"
		)	
}

function msg_Aria_after_first_pump_JP(){
	ctb_msg( // after first water inflation
		"[speaker:Aria][ex:ex_blush]わあ...",
		"[speaker:Player]どんな感じ？",
		"[speaker:Aria][ex:ex_blush][sound:belly_slosh]お腹がパンパン、これが水泳のレッスンに役立つの？",
		"[speaker:Player]そうは思わな...",
		"[speaker:Aria][ex:ex_smile]",
		"[speaker:Player]き、きっと役に立つよ"
		)	
}

///////////////////////////

function msg_Aria_rescue_EN(){
	ctb_list(
		noone,
		noone, 
		"[speaker:Aria][ex:ex_smile]Thank you so so much for saving me! I don't even know I can thank you.",
		"[ex:idle][speaker:Player] [c:blue]I can think of a few things... [c:default]",
		"[speaker:Aria][ex:ex_talk]So uh, do you come here often?",
		"[speaker:Player] Uhh yeah! [font:tiny] This is totally not my first time. [font:normal]",
		"[speaker:Aria][ex:ex_blush] Then please, would you mind giving me swim lessons? My previous swim teacher had to leave. I'll pay you $30 per session!",
		"[speaker:Player] Cmon, If I save your life for free it's only fair I teach you how to swim for free.",
		"[speaker:Aria][ex:ex_surprise] Please! I can't ask you to do this for free.",
		"[speaker:Player][c:blue] Odd, I wonder why she's so adament about paying me?",
		"[speaker:Player][c:blue] I should probably find out why she's so desperate later [c:default]",
		"[speaker:Aria][ex:ex_smile]Thank you so much! I will be here from 7 to 9 am every monring. Come whever you can!", 
		"Also here is my number, lets hang out when you're free.",
		"[speaker:Player] Of course! I could even help you with your swimming if you'd like [font:tiny] I have a few pump related ideas...[font:normal]",
		"[speaker:Aria][ex:ex_smile2] that sounds amazing![font:tiny]What was that last part though?[font:default]",
		"[ex:ex_idle][speaker:noone] (You updated your journal schedule and added her number to your phone)");
}

function msg_Aria_rescue_RUS(){
	ctb_list(
		noone,
		noone, 
		"[speaker:Aria][ex:ex_smile]Спасибо тебе большое за то, что спасла меня. Я даже и не знаю как благодарить тебя.",
	"[ex:idle][speaker:Player] [c:blue]Мне надо обдумать несколько вещей...[c:default]",
	"[speaker:Aria][ex:ex_talk]Так ты часто сюда приходишь?",
	"[speaker:Player] Ух ага! [font:tiny] Для меня это не впервой [font:normal]",
	"[speaker:Aria][ex:ex_blush] Тогда, пожалуйста, не могла бы ты дать мне уроки плавания? Моему предыдущему учителю по плаванию пришлось уйти. Я заплачу тебе 30 долларов за сеанс!",
	"[speaker:Player] Да ладно, если я спасу твою жизнь бесплатно, это будет справедливо, я научу тебя плавать бесплатно.",
	"[speaker:Aria][ex:ex_surprise] Пожалуйста! Я не могу попросить тебя сделать это бесплатно.",
	"[speaker:Player][c:blue] Странно, интересно, почему она так упорно пытается заплатить мне?",
	"[speaker:Player][c:blue] Я, наверное, позже узнаю, почему она в таком отчаянии [c:default]",
	"[speaker:Aria][ex:ex_smile]Большое спасибо! Я буду здесь с 7 до 9 каждое утро. Приходи, как сможешь!", 
	"А еще вот мой номер, давай потусуемся, когда ты свободна.",
	"[speaker:Player] Конечно! Я могла бы даже помочь тебе с плаванием, если хочешь [font:tiny] У меня есть несколько идей, связанных с насосом ...[font:normal]",
	"[speaker:Aria][ex:ex_smile2] Звучит замечательно![font:tiny]",
	"Что это была за последняя часть?[font:default]",
	"[ex:ex_idle][speaker:noone] (Ты обновила расписание своего дневника и добавила ее номер в свой телефон)");
}

function msg_Aria_rescue_CN(){
	ctb_list(
		noone,
		noone, 
	"[speaker:Aria][ex:ex_smile]感谢你救了我！我都不知道该做些什么来报答你。",
	"[ex:idle][speaker:Player] [c:blue]我倒是知道让你做什么……[c:default]",
	"[speaker:Aria][ex:ex_talk]那……你经常来这里么？",
	"[speaker:Player]呃……对呀！[font:tiny]其实我是第一次来到这里。[font:normal]",
	"[speaker:Aria][ex:ex_blush]那拜托你，你可以教我游泳么？我之前的那个游泳老师离开了，我每节课都付你$30可以么？",
	"[speaker:Player]我救了你一命都没要你钱，教你游泳也不用给我钱了。",
	"[speaker:Aria][ex:ex_surprise]求求你了！我不会让你免费教我的！",
	"[speaker:Player][c:blue]好奇怪啊，为什么她这么想给我钱？",
	"[speaker:Player][c:blue]没准之后我就知道原因了。",
	"[speaker:Aria][ex:ex_smile]太感谢你了！我之后每天早上7点到9点都在这里，如果可以的话就过来吧！",
	"以及这是我的电话号码，如果你有时间咱们可以一起出去玩。",
	"[speaker:Player]没问题！我甚至可以教你游泳。[font:tiny]我还有一些和泵有关的打算……[font:normal]",
	"[speaker:Aria][ex:ex_smile2]那太棒了！不过你最后一句说的是什么呀，我没听清？[font:default]",
	"[ex:ex_idle][speaker:noone](你更新了你的日程表，并将她的电话号码加到了手机中。)"
);

}

function msg_Aria_rescue_JP(){
	ctb_list(
		noone,
		noone, 
	"[speaker:Aria][ex:ex_smile]助けてくれて本当に本当にありがとうございます！ なんてお礼を言えばいいのか...。",
	"[ex:idle][speaker:Player] [c:blue]色々と考えを巡らせる... [c:default]",
	"[speaker:Aria][ex:ex_talk]それで、えーっと、ここにはよく来るの？",
	"[speaker:Player] えっ、うん！ [font:tiny] 初めてじゃないけど。 [font:normal]",
	"[speaker:Aria][ex:ex_blush] では、どうか私に水泳のレッスンをしてもらえませんか？ 前の水泳の先生が辞めてしまったんです。1回につき $30 払います！",
	"[speaker:Player] え～、助けてあげたのが無料だったし、泳ぎ方も無料で教えてあげるよ。",
	"[speaker:Aria][ex:ex_surprise] おねがいです！ 無料では頼めません。",
	"[speaker:Player][c:blue] どうして私にお金を払うことに固執しているのかな？",
	"[speaker:Player][c:blue] 彼女がどうしてそんなに必死なのか、あとで調べてみようかな。 [c:default]",
	"[speaker:Aria][ex:ex_smile] 本当にありがとうございます！ 私は毎朝７時から９時までここにいます。よかったら来てください！", 
	"そして、これは私の番号です。時間があえば一緒に遊んでください。",
	"[speaker:Player] もちろん！ よかったら、水泳のお手伝いもするね！ [font:tiny] ポンプを使うアイデアもあるし...[font:normal]",
	"[speaker:Aria][ex:ex_smile2] やったあ！ [font:tiny]でも最後の部分は何だったんだろ？[font:default]",
	"[ex:ex_idle][speaker:noone]（日記の予定を更新して、彼女の番号を携帯電話に追加しました。）"
);

}
//////////////

function msg_Aria_rescue_start_EN(){
	ctb_list(noone, rmPool ,
		"Immediately after entering, you noticed a small girl strugglling underneath the waters",
		"the life guard was too occupied looking at his phone to notice. It would be faster to jump into the pool yourself.",
		"[set_background:sprAriaIntro2]Without wasting a hearbeat, you jumped in and gently pulled her out."
	);
}

function msg_Aria_rescue_start_CN(){
	ctb_list(noone, rmPool ,
		"一进游泳馆，你注意到一个小女孩正在水中挣扎。",
		"救生员在忙着玩手机，与其叫他过来，不如你自己去水中救人更快一些。",
		"[set_background:sprAriaIntro2]没有丝毫犹豫，你跳入水中将小女孩救了出来。"
	);
}


function msg_Aria_rescue_start_JP(){
	ctb_list(noone, rmPool ,
		"プールに入ると少女がプールで溺れている",
		"どうやら監視員はスマホに気を取られていて気づいていない、自分が助けに行ったほうが早そうだ。",
		"[set_background:sprAriaIntro2]急いで飛び込んで、彼女を救い出した。"
	);
}

function msg_Aria_rescue_start_RUS(){
	ctb_list(noone, rmPool ,
		"Сразу после окончания, ты замечаешь небольшую девушку, барахтающуюся под водой",
		"Спасатель был слишком занят, залипая в своем телефоне, и было быстрее прыгнуть в бассейн самой.",
		"[set_background:sprAriaIntro2]Не теряя ни секунды, ты нырнула и аккуратно вытащила ее из воды."
	);
}