if (live_call()) return live_result;
// start from right 90 is 1

if (mouse_check_button_pressed(mb_left)) {
    
    var _buff = 10;
    var _posX = 50;
    var _posY = 50;
    
    for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
            
            if (_posX + _size*i + _buff*i < device_mouse_x_to_gui(0) && 
                           _posY + _size*j + _buff*j < device_mouse_y_to_gui(0) &&
                           _posX +  _size*i+_size + _buff*i > device_mouse_x_to_gui(0) &&
                           _posY + _size*j+_size + _buff*j > device_mouse_y_to_gui(0) ) {
                           var _selected = 1 + (i)*3+(j);
                           
                           // Can't select middle one
                           if (_selected == 5) return;
                           
                           selected = selected ^ (1 << _selected);
                           map = ignore_corners(selected);

                            /*
                            var found = false;
                            for (var i = 0; i < array_length(global.saveF.indexes); i++) {
                                if (global.saveF.indexes[i] == map) {
                                    array_push(global.saveF.values[i], []);
                                    found = true;
                                }
                            }
                            if (!found) {
                                array_push(global.saveF.indexes, map);
                                array_push(global.saveF.values, [ds_grid_write(oEditor.level)])
                            }*/
                           
                           
           }
        }
    }
    
    
}
 

if (keyboard_check_pressed(ord("S"))) {
    if (ds_map_exists(global.saveF, string(map))) {
        //array_push(global.saveF[? string(map)], oEditor.level);
        if (array_length(global.saveF[? string(map)]) < currentlevelNum) array_push(global.saveF[? string(map)], oEditor.level);
        else global.saveF[? string(map)][currentlevelNum] = oEditor.level;
    }
    else {
        ds_map_add(global.saveF, string(map), [oEditor.level]);
    }
    saveData();
    //show_debug_message(ds_map_write(global.saveF));
}

if (keyboard_check_pressed(ord("T"))) {
    loadData();
    if (ds_map_exists(global.saveF, string(map))) {
        oEditor.level = global.saveF[? string(map)][currentlevelNum];
    }
    
    //show_debug_message(ds_map_write(global.saveF));
}

if (keyboard_check_pressed(vk_up)) {
    currentlevelNum++;
}
if (keyboard_check_pressed(vk_down)) {
    currentlevelNum--;
}
