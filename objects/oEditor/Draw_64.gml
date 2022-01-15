if (live_call()) return live_result;
draw_set_color(c_white);

for (var i = 0; i < 5; i++) {
    for (var j = 0; j < 5; j++) {
        
        if (scolor == i+j*5) {
            draw_set_color(c_red);
            draw_rectangle(toolX + toolSize*i + toolBuff*i, 
                           toolHeight + toolSize*j + toolBuff*j,
                           toolX +  toolSize*i+toolSize + toolBuff*i,
                           toolHeight + toolSize*j+toolSize + toolBuff*j,false);
        }
        draw_set_color(c_white);
        draw_rectangle(toolX + toolSize*i + toolBuff*i, 
                           toolHeight + toolSize*j + toolBuff*j,
                           toolX +  toolSize*i+toolSize + toolBuff*i,
                           toolHeight + toolSize*j+toolSize + toolBuff*j,true);
                           
        draw_text(toolX + toolSize*i + toolBuff*i, toolHeight + toolSize*j + toolBuff*j, string(i+j*5))
        
    }
}