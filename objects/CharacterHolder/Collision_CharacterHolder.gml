if (move_counter>=0){
    move_outside_all(point_direction(other.x, y, x,y), 20);
    other.temp = id;
    with (other) move_outside_all(point_direction(temp.x, y, x,y), 20);
}
move_counter --;

