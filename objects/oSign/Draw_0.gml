draw_self(); // like super.draw();

if (nearby)
{
	draw_sprite_ext(sMarker, 0, x, y-32, 1, -1, 0, c_white, 0.5);
}
