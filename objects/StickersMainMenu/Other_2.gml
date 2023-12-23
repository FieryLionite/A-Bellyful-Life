 texturegroup_set_mode(false, false, sprBlank);
 
 global.last_room = room;
 global.save_tab = 0;
 global.upload_content = noone;
 global.settings = ds_map_create();
 global.settings[? "All Sounds"] = true;
 global.settings[? "Music"] = true;
 global.settings[? "Remove Expired"] = true;
 global.settings[? "Skew Animation"] = true;
 global.settings[? "Enable Portals"] = false;
 global.settings[? "Blurr Backgrounds"] = true;
 global.settings[? "Belly Burst"] = true;
 
 global.settings[? "burp sound"] = false;
global.settings[? "fart sound"] = false;
global.settings[? "vomit sound"] = true;
global.settings[? "Fullscreen"] = false;
global.settings[? "Snowing"] = true;

global.settings[? "Christmas"] = true;
global.version = "0.4.0";

global.screen_lock = false;