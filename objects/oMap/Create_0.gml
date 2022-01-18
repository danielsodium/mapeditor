if (live_call()) return live_result;
selected = 0;
_size = 40;

currentlevelNum = 0;
currentSaves = 0;

map = 0;
global.saveN = 1;

global.saveF = ds_map_create();
loadData();
