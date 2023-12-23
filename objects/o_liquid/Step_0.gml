if (x != xprevious || y != yprevious){
    if (!instance_position(x - size, y, ControlMassage) || !instance_position(x + size, y, ControlMassage))
        instance_destroy();
}