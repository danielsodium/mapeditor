

function clear_corners(_map) {
    if (live_call()) return live_result;
    var _newMap = _map;
    if (bget(_map, 1) && bget(_map, 2) && bget(_map, 4)) {
        _newMap =  bset(_map, 1);
    }
    if (bget(_map, 3) && bget(_map, 2) && bget(_map, 6)) {
        _newMap =  bset(_map, 3);
    }
    if (bget(_map, 7) && bget(_map, 4) && bget(_map, 8)) {
        _newMap =  bset(_map, 7);
    }
    if (bget(_map, 9) && bget(_map, 6) && bget(_map, 8)) {
        _newMap =  bset(_map, 9);
    }
    return _newMap;
    
}

function ignore_corners(_map) {
    if (live_call()) return live_result;
    var _newMap = _map;
    if (bget(_newMap, 1)) {
        _newMap = bset(_newMap, 1);
    }
    if (bget(_newMap, 3)) {
        _newMap = bset(_newMap, 3);
    }
    if (bget(_newMap, 7)) {
        _newMap = bset(_newMap, 7);
    }
    if (bget(_newMap, 9)) {
        _newMap = bset(_newMap, 9);
    }
    return _newMap;
}


function bget(_num, _index) {
    return (_num >> _index) & 1;
}

/*
    @desc Changes a number's value at a binary index to the opposite.
*/
function bset(_num, _index) {
    return _num ^ (1 << _index);
}