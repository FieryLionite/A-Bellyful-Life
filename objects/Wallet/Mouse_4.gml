global.room_coins[$ string(room)].wallets --;
//ControlEnv.money += choose(1,2);
var wallet = instance_create_depth(0,0,0,ILostWallet);
wallet.is_template = false;
effect_create_above(ef_spark, x+random_range(-5,5), y+random_range(-5,5), 0, c_white);
audio_play_sound(sndBackpack, 0, 0);
instance_destroy();