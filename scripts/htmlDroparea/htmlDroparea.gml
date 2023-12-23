// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function htmlDroparea() constructor {
	
	exists = false;
	
	function SetFileHandler(func) {
		HandleFile = func;
	}
	
	function HandleFile(file) {
		show_debug_message("what i should do with this file? " + json_stringify(file));
	}
	
	function Create(x, y, w, h) {
		if (os_browser == browser_not_a_browser && exists)
			return false;
		//show_message(str(x) + ", " + str(y) + ", " +str(w)+ ", "+str(h))
		exists = true;
		dbCreateDropbox(x, y, w, h);
		return true;
	}
	
	function Remove() {
		if (!exists)
			return;
		exists = false;
		dbRemoveDropbox();
	}
	
	function IsFileUnder() {
		return dbDropboxStatus();
	}
	
	function CheckFiles() {
		var files = dbReturnFiles();
		if (is_string(files)) {
			var json = json_parse(files);
			if (is_array(json)) {
				for(var i = 0; i < array_length(json); i++) {
					var obj = json_parse(json[i]);
					HandleFile(new fileFabric(obj, self));
				}
			}
		}
	}
	
	http_requests = ds_list_create();
	function HandleHTTP() {
		var _id = async_load[? "id"],
			status = async_load[? "status"];
			
		if (status == 0) {
			for(var i = 0; i < ds_list_size(http_requests); i++) {
				var r = http_requests[| i];
				if (r.id == _id) {
					r.handler(async_load[? "result"], r.source);
					ds_list_delete(http_requests, i);
					break;
				}
			}
		}
	}
	
	fileFabric = function(struct, interface) constructor {
		name = struct.name;
		link = struct.link;
		self.interface = interface;
		
		function CopyToAsync(dest_path, on_complete) {
			ds_list_add(interface.http_requests, {
				source: self,
				id: http_get_file(link, dest_path),
				handler: on_complete
			})
		}
		
		function CopyTo(dest_path) {
			return http_get_file(link, dest_path);
		}
	}
}