function attack_step() {
	if (object_index != Card
	    || (object_index == Card && girl.cooling == 0 && girl.warming == 0))
	    atk_counter ++;
    
	//full penalty
	if (object_index == Card && girl.stomach > girl.stomach_max){
	    atk_counter -= 0.5;
	    if (girl.stomach > girl.stomach_max*2)
	        atk_counter -= 0.5;
	}

	if (atk_counter > atk_rate*atk_rate_mult){
	    atk_counter = 0;
    
	    if (target.object_index == Card){
	        damage_type = 0;
	        var damage = (atk_damage - target.girl.def)*target.girl.protection
	        if (damage <= 0)
	            damage = 1;
	        target.girl.sp -= damage;
	    }else{
	        damage_type = 2;
	        var damage = (atk_damage - target.def)*target.protection;
	        if (damage <= 0)
	            damage = 1;
            
	        target.hp -= damage
	        girl.stomach += atk_damage*target.protection;
        
	        if (target.is_spicy && !girl.resist_spicy)
	            girl.spicy += atk_damage/2;
	        if (target.is_frozen && !girl.resist_freeze)
	            girl.freeze += atk_damage/2;
	    }
    
	    effect_stat(target.xcenter - target.sprite_width/2, target.ycenter + target.sprite_height/2, damage_type, -atk_damage);
	    if (damage_type == 2){
	        effect_stat(xcenter - sprite_width/2, ycenter + sprite_height/2, 1, damage);
	    }
	    if (object_index == Card)
	        sprite_weapon = weapon_get_sprite(girl.wp_type)
        
	    effect_weapon(sprite_weapon, target, id, -50); 
	    target.shaking = true;
	    audio_play_sound(snd_swing, 1, false);
	}

	if (shaking){
	    xx = random(20 - shake_counter);
	    yy = random(20 - shake_counter);
	    shake_counter ++;
	    if (shake_counter >= 15){
	        shake_counter = 0;
	        shaking = false;
	        xx = 0;
	        yy = 0;
	    }
	}



}
