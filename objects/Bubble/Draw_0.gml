
if (msg != "")
{
    draw_set_font(fnt_dialogue);
    //draw_self();
    draw_set_color(c_black)
    msg_dynamic(msg, ord("Q"));
    draw_sprite(sprSkip, 0, x, - 100);
}
else
{
    msg_reset();
}

