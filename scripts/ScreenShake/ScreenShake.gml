/// @desc ScreenShake(magnitude, frames)
/// @arg magnitude sets the strength of the shake radius (in pixels)
/// @arg frames sets the length of the shake in frames (60==1sec @ 60fps)

with (oCamera)
{
	// Make sure the shake is bigger than the shake that's already happening. 
	// Otherwise let the bigger shake keep playing out
	if (argument[0] > shake_remain)
	{
		shake_magnitude = argument[0];
		shake_remain = argument[0];
		shake_length = argument[1];
	}
}