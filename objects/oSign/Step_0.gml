/// @description Read the sign

if (!instance_exists(oPlayer))
	return;

// If the player is close to the sign and text isn't already showing
if (point_in_circle(oPlayer.x, oPlayer.y, x, y, 64) && !instance_exists(oText))
{
	nearby = true;
	if (keyboard_check_pressed(ord("W"))
		|| gamepad_axis_value(0, gp_axislv) < -0.4 
		|| gamepad_button_check_pressed(0, gp_face4))
	{
		with (instance_create_layer(x, y-64, layer, oText))
		{
			text = other.text;
			length = string_length(text);
		}
	}
}
else
{
	nearby = false;
}