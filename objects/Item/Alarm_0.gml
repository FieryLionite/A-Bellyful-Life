//show_debug_message(object_get_name(object_index));
bites = image_number;
bite_volume = ceil(volume / bites);
bite_calories = ceil(calories / bites);
bite_energy = ceil(energy/bites);
bite_alcohol = ceil(alcohol/bites);
bite_high = ceil(high/bites);
if (is_pill){// || is_tool){
	do_expire = false;
	script_use_on_item = item_on_item;
}

if (is_tool)
	do_expire = false;