#macro EN 0
#macro RUS 1
#macro JP 2
#macro CN 3
#macro VN 4

global.language = EN;
function strlan(){
	var en_str = "";
	for (var i=0; i<argument_count; i+= 2){
			if (argument[i] == global.language)
				return argument[i+1];	
			else if (argument[i] == EN)
				en_str = argument[i + 1];
	}
	
	return en_str;
}

function exelan(fname){
	var lan_name = language_str(global.language);
	var script = asset_get_index(fname+"_"+lan_name);
	if (script == -1){
		lan_name = "EN";
		script = asset_get_index(fname+"_"+lan_name);
	}
	
	return script();
		
}

function language_str(index){
	switch (index){
		case EN:
			return "EN";
		case RUS:
			return "RUS";
		case JP:
			return "JP";
		case VN:
			return "VN";
		case CN:
			return "CN";
	}
	
	return "N/A";
}

global.item_names = ds_map_create();
var item_names = ds_list_create();
ds_list_add(item_names, "Cocktail1","Cocktail2","Cocktail3","Cocktail4","Beer","Pump","MiniPump","Apple","Orange","CakeSlice","NextLine","Espresso","Frappuccino","GreenTeaFrap","OrangeJuice","Soda","Sundea","Milk","Hamburger","Hotdog","Hugeburger","Fries","PillDiet","PillDigest","PillGas","PillNoise","PillLaxative","BottleDiet","BottleDigest","BottleGas","BottleNoise","BottleLaxative","Bottle","BottleWater","Umbrella","Bike","Tripod","WeedBag","WeedBagExotic","SmokingPipe","CigarettePack")

var item_names_RUS = ds_list_create();
ds_list_add(item_names_RUS, "Коктейль 1","Коктейль 2","Коктейль 3","Коктейль 4","Пиво","Насос","Мини-Насос","Яблоко","Апельсин","Кусок Торта","Некст Лайн","Эспрессо","Фрапучино","Зелёный Фрапе Чай","АпельсиновыйСок","Газировка","Мороженное","Молоко","Гамбургер","Хот-Дог","Супер-бургер","Картошка Фри","Диетические Таблетки","Таблетки Для Набора Веса","Газовые Таблетки","Шумовые Таблетки","Слабительные Таблетки","Банка Диетических Таблеток","Банка Таблеток Для Набора Веса, Банка Газовых Таблеток, Банка Шумовых Таблеток","Банка Слабительных Таблеток","Бутылка","Бутылка Воды","Зонтик","Велосипед","Штатив","Пакетик Травки","Пакетик Экзотической Травки","КурительнаяТрубка","Пачка Сигарет");

var item_names_JP = ds_list_create();
ds_list_add(item_names_JP, "カクテル1","カクテル2","カクテル3","カクテル4","ビール","ハンドポンプ","小型ポンプ","リンゴ","オレンジ","ケーキ","NextLine","エスプレッソ","フラップチーノ","抹茶フラップ","オレンジジュース","炭酸飲料","サンデー","ミルク","ハンバーガー","ホットドッグ","巨大バーガー","フライドポテト","ダイエット薬（錠剤）","消化剤（錠剤）","ガス発生薬（錠剤）","腹鳴強化薬（錠剤）","下剤（錠剤）","ダイエット薬（瓶）","消化剤（瓶）","ガス発生薬（瓶）","腹鳴強化薬（瓶）","下剤（瓶）","薬瓶","水ボトル","傘","自転車","カメラ用三脚","ハッパ","ハッパ（強烈）","喫煙用パイプ","タバコ");

var item_names_CN = ds_list_create();
ds_list_add(item_names_CN, "鸡尾酒1","鸡尾酒2","鸡尾酒3","鸡尾酒4","啤酒","泵","迷你泵","苹果","橙子","蛋糕(块)","下一行","特浓咖啡","卡布奇诺","抹茶咖啡","橙汁","苏打水","圣代冰淇淋","牛奶","汉堡","热狗","巨型汉堡","薯条","减肥药(片)","消化药(片)","产气药(片)","产声药(片)","泻药(片)","减肥药(瓶)","消化药(瓶)","产气药(瓶)","产声药(瓶)","泻药(瓶)","瓶子","瓶装水","雨伞","自行车","三脚架","烟草包","大烟草包","烟斗","盒装香烟");

for (var i=0; i < ds_list_size(item_names); i++){
		var list = ds_list_create();
		ds_list_add(list,
			item_names_RUS[| i],
			item_names_JP[| i],
			item_names_CN[| i]
		)
		var name = string_replace(item_names[| i], " ", "");
		global.item_names[? name] = list;
}

aa= 0;

#macro str_drink strlan(EN, "Drink", RUS, "Пить", JP, "飲む", CN, "喝")
#macro str_throwup strlan(EN, "Throw up", RUS, "Блювануть", JP, "吐く", CN, "呕吐")
#macro str_unhook strlan(EN, "unhook shower head", RUS, "использовать насадку для душа", JP, "シャワーヘッドのフックを外します", CN, "解开淋浴头")
#macro str_refill strlan(EN, "Refill Bottle", RUS, "Заполнить бутылку", JP, "詰め替えボトル", CN, "补充瓶")
#macro str_food strlan(EN, "Food", RUS, "Еда", JP, "食べ物", CN, "食物")
#macro str_water strlan(EN, "Water", RUS, "Воды", JP, "水", CN, "水")
#macro str_air strlan(EN, "Air", RUS, "Воздух", JP, "エア", CN, "空气")
#macro str_energy strlan(EN, "Energy", RUS, "энергия", JP, "エネルギー", CN, "活力")
#macro str_mins strlan(EN, "mins", RUS, "мин", JP, "分", CN, "分钟")
//#macro str_unhook = strlan(EN, "Throw up", RUS, "", JP, "", CN, "");