if (live_call()) return live_result;

var _buff = 10;
var _posX = 50;
var _posY = 50;

for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
        
        if (1 + (i)*3+(j) == 5) draw_set_color(c_red);
        else {
            var _select = selected >> (1 + (i)*3+(j)) & 1;
            draw_set_color(_select ? c_red : c_white);
        }
        
        draw_rectangle(_posX + _size*i + _buff*i, 
                       _posY + _size*j + _buff*j,
                       _posX +  _size*i+_size + _buff*i,
                       _posY + _size*j+_size + _buff*j,false);
    }
}


draw_text(window_get_width()- 50, 40, currentlevelNum);