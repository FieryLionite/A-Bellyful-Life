/// @description Override me for each option

switch(selected)
{
    case 0:
        show_message("You clicked the Settings option");
        break;
    case 1:
        show_message("You clicked the Sync option");
        break;
    case 2:
        show_message("You clicked the Play Game option");
        break;
    default: break;
}

instance_destroy();

