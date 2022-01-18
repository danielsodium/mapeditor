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
                           if (ds_map_exists(global.saveF, string(map))) {
                               currentSaves = array_length(global.saveF[? string(map)]);
                           } else currentSaves = 0;
                           

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
    var savedLevel = ds_grid_write(oEditor.level);
    if (ds_map_exists(global.saveF, string(map))) {
        if (array_length(global.saveF[? string(map)]) <= currentlevelNum) array_push(global.saveF[? string(map)], savedLevel);
        else {
            show_debug_message("POTATO");
            global.saveF[? string(map)][currentlevelNum] = savedLevel;
        }
    }
    else {
        ds_map_add(global.saveF, string(map), [savedLevel]);
    }
    saveData();
    show_debug_message(ds_grid_write(oEditor.level));
}

if (keyboard_check_pressed(ord("F"))) {
    loadData();
    if (ds_map_exists(global.saveF, string(map)) && array_length(global.saveF[? string(map)]) > currentlevelNum) {
        show_debug_message("CLEAR");
        ds_grid_read(oEditor.level, global.saveF[? string(map)][currentlevelNum]);
    } else {
        ds_grid_clear(oEditor.level, 0);
    }
    
    show_debug_message("LAODED");
}
/*
if (keyboard_check_pressed(ord("S"))) {
    var savedLevel = ds_grid_create(ds_grid_width(oEditor.level), ds_grid_height(oEditor.level));
    ds_grid_copy(savedLevel, oEditor.level);
    if (ds_map_exists(global.saveF, string(map))) {
        //array_push(global.saveF[? string(map)], oEditor.level);
        
        if (array_length(global.saveF[? string(map)]) < currentlevelNum) array_push(global.saveF[? string(map)], savedLevel);
        
        else global.saveF[? string(map)][currentlevelNum] = savedLevel;
    }
    else {
        ds_map_add(global.saveF, string(map), [savedLevel]);
        ds_map_clear(global.saveF);
    }
    //saveData();
    show_debug_message(ds_map_write(global.saveF));
}

if (keyboard_check_pressed(ord("F"))) {
    loadData();
    if (ds_map_exists(global.saveF, string(map))) {
        show_debug_message("CLEAR");
        ds_grid_copy(oEditor.level, global.saveF[? string(map)][currentlevelNum]);
    }
    
    show_debug_message("LAODED");
}
*/


if (keyboard_check_pressed(vk_up)) {
    if (ds_map_exists(global.saveF, string(map))) {
        show_debug_message(global.saveF[? string(map)]);
        if (array_length(global.saveF[? string(map)]) > currentlevelNum) {
            currentlevelNum++;
        }
        else {
            currentlevelNum = 0;
        }
    }
    
    
}
if (keyboard_check_pressed(vk_down)) {
    if (currentlevelNum > 0) {
        currentlevelNum--;
    }
    else {
        if (ds_map_exists(global.saveF, string(map))) {
            currentlevelNum = array_length(global.saveF[? string(map)]);
        }
    }
}
