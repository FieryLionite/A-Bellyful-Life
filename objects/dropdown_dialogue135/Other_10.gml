/// @description Override me for each option

item = log[? selected];
if (item == undefined)
    exit;
    
if (!item[1]){
    //say(item[2]);
    ctb_list(noone, noone, item[2]);
}else{
    script_execute(item[2]);
}

instance_destroy();

