function level_up() {
	pre_sp_max = sp_max;
	pre_stomach_max = stomach_max;
	pre_digest = digest

	pre_atk_damage = atk_damage;
	pre_atk_rate = atk_rate;


	sp_max *= 1.15;
	stomach_max *= 1.30;
	digest *= 1.20

	atk_damage *= 1.15;
	atk_rate *= 0.85;

	sp_max = ceil(sp_max);
	stomach_max = ceil(stomach_max);
	atk_damage = ceil(atk_damage);
	atk_rate = floor(atk_rate);



}
