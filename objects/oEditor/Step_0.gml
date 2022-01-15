if (live_call()) return live_result;

if (mouse_check_button(mb_left) || keyboard_check(vk_space)) {
    if (mouse_x > _posX && mouse_x < _posX + TILESIZE*(mapX) && 
        mouse_y > _posY && mouse_y < _posY + TILESIZE*(mapY)) {
            level[# floor((mouse_x-_posX)/TILESIZE), floor((mouse_y-_posY)/TILESIZE)] = scolor;
    }
}
if (mouse_check_button_pressed(mb_side2) || keyboard_check_pressed(ord("1"))) {
    scolor++;
    if (scolor > 1) scolor = 0;
    show_debug_message(scolor);
}
if (mouse_check_button_pressed(mb_side1)) {
    scolor--;
    if (scolor < 0) scolor = 1;
    show_debug_message(scolor);
}
