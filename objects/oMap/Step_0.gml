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
                           used = true;
           }
        }
    }
    
    
}
 
