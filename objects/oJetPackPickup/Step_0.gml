y = yStart + sin(get_timer() / 200000) * 5; // Float up and down 5 pixels


if (global.killsThisRoom == 0)
{
	visible = false;
}
else if (global.killsThisRoom == 1)
{
	visible = true;
}