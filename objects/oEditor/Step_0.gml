if (live_call()) return live_result;

if (mouse_check_button_pressed(mb_left)) {
    
    if (toolX < device_mouse_x_to_gui(0) && 
                           toolHeight < device_mouse_y_to_gui(0) &&
                           toolX +  toolSize*5 + toolBuff*4 > device_mouse_x_to_gui(0) &&
                           toolHeight + toolSize*5 + toolBuff*4 > device_mouse_y_to_gui(0) ) {
                               
        var _sel = floor((device_mouse_x_to_gui(0)-toolX)/(toolSize+toolBuff)) 
                 + floor((device_mouse_y_to_gui(0)-toolHeight)/(toolSize+toolBuff))*5;
        if (tools > _sel) scolor = _sel;
           
    }
}

if (mouse_check_button(mb_left) || keyboard_check(vk_space)) {
    if (mouse_x > _posX && mouse_x < _posX + TILESIZE*(mapX) && 
        mouse_y > _posY && mouse_y < _posY + TILESIZE*(mapY)) {
            level[# floor((mouse_x-_posX)/TILESIZE), floor((mouse_y-_posY)/TILESIZE)] = scolor;
    }
}
if (mouse_check_button_pressed(mb_side2) || keyboard_check_pressed(ord("1"))) {
    scolor++;
    if (scolor > tools) scolor = 0;
    show_debug_message(scolor);
} else if (mouse_check_button_pressed(mb_side1)) {
    scolor--;
    if (scolor < 0) scolor = 1;
    show_debug_message(scolor);
}

if (keyboard_check_pressed(ord("Q"))) {
    ds_grid_clear(level, 0);
}