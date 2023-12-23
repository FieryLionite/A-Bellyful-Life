global.room_coins[$ string(room)].coins --;
ControlEnv.money += choose(1,2);
effect_create_above(ef_spark, x+random_range(-5,5), y+random_range(-5,5), 0, c_white);
audio_play_sound(sndCoin, 0, 0);
instance_destroy();