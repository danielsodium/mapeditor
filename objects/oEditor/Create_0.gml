if (live_call()) return live_result;

window_set_cursor(cr_cross);

mapX = 20;
mapY = 20;
_buff = 10;
_posX = 100;
_posY = 100;

scolor = 1;

level = ds_grid_create(mapX, mapY);