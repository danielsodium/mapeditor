
function saveData() {
    if (live_call()) return live_result;
    var fileName = "save" + string(global.saveN) + ".sav";
	var _saveData = {
	    save : ds_map_write(global.saveF)
	};
	var _string = json_stringify(_saveData);
	show_debug_message(_string);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed,1);
	buffer_write(_buffer, buffer_string,_string);
	buffer_save(_buffer, fileName);
	buffer_delete(_buffer);
}

function loadData() {
    if (live_call()) return live_result;
    var fileName = "save" + string(global.saveN) + ".sav";
	if (file_exists(fileName)) {
		var _buffer = buffer_load(fileName);
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		var _loadData = json_parse(_string);
		ds_map_read(global.saveF, _loadData.save);
	}
}