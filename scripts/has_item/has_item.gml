function has_item(index){
	do_have_item = false;
		with (index){
			if (!is_template && !in_fridge){
				other.do_have_item = true;
			}
		}
		return do_have_item;
}