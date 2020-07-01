/// @description Progress text

letters += spd;

if (letters >= length)
	frameSinceFinishedDrawing++;

text_current = string_copy(text, 1, floor(letters)); // strings count from 1!

draw_set_font(fSign);

if (h == 0)
{
	h = string_height(text);
}
w = string_width(text_current);

// Destroy when done
if (letters >= length && frameSinceFinishedDrawing > 66.6 && (keyboard_check_pressed(vk_anykey) 
		|| abs(gamepad_axis_value(0, gp_axislh)) > 0.333
		|| gamepad_button_check(0, gp_face1)))
{
	instance_destroy();
	with(oCamera) follow = oPlayer;
}