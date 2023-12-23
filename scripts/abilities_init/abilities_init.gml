function abilities_init() {
	global.abilities = ds_map_create();
	ability_create("push", 0);
	ability_create("remove", 200);
	ability_create("check", 0);
	ability_create("status", 0);
	ability_create("grind", 0);



}
