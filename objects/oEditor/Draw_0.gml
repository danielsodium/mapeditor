if (live_call()) return live_result;



for (var i = 0; i < mapX; i++) {
    for (var j = 0; j < mapY; j++) {
        
        var _sprite = get_sprite(level[# i, j]);
        
        if (_sprite != undefined) draw_sprite(_sprite, 0, _posX + TILESIZE*i, _posY + TILESIZE*j);
        // draw a red rectangle
        /*
        switch(level[# i, j]) {
            case 0: 
                draw_set_color(c_black);
                break;
            case 1:
                draw_set_color(c_red);
                break;
        }
       
       
        
        
        draw_rectangle(_posX + TILESIZE*i, 
                       _posY + TILESIZE*j,
                       _posX +  TILESIZE*i+TILESIZE,
                       _posY + TILESIZE*j+TILESIZE,false);
                       */
        // Outline
        draw_set_color(c_white);
        draw_rectangle(_posX + TILESIZE*i, 
                       _posY + TILESIZE*j,
                       _posX +  TILESIZE*i+TILESIZE-1,
                       _posY + TILESIZE*j+TILESIZE-1,true);
    }
}
