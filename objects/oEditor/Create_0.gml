if (live_call()) return live_result;

window_set_cursor(cr_cross);

mapX = 5;
mapY = 5;
_buff = 10;
_posX = 500;
_posY = 200;

tools = 5//[0,1,2,3,4,5];

scolor = 1;

level = ds_grid_create(mapX, mapY);

toolHeight = window_get_height()- 250;
toolX = 10;
toolSize = 40;
toolBuff = 5;
