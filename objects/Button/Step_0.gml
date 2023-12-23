if (pos_relative){

    //set first pos
    if (xx == -1){
        xx = x;
        yy = y;
    }
    
    x = __view_get( e__VW.XView, 0 ) + xx;
    y = __view_get( e__VW.YView, 0 ) + yy;
}

