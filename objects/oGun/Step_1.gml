/// @description 
/// in begin step so it lags behind the player by one frame..
/// to give the gun a sense of weight.

x = oPlayer.x;
y = oPlayer.y+10;

if (oPlayer.controller == 0)
{
	// Set the angle of the gun to point to the mouse
	image_angle = point_direction(x, y, mouse_x, mouse_y);
}
else
{
	var controllerh = gamepad_axis_value(0, gp_axisrh);	
	var controllerv = gamepad_axis_value(0, gp_axisrv);
	if (abs(controllerh) > 0.1 || abs(controllerv) > 0.1)
	{
		controllerAngle = point_direction(0, 0, controllerh, controllerv);	
		image_angle = controllerAngle;
	}
}

// FiringDelay makes it so we only shoot a bullet every 5 frames or so
// So it acts like a timer until we can fire again
firingDelay = max(0, firingDelay - 1);

// Reduce recoil by 1 or keep it at 0
recoil = max(0, recoil - 1);

// Fire the gun on mouse click
if ((mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb))
	&& global.gunBlood >= bloodUsedPerShot && firingDelay <= 0 )
{
	firingDelay = initFiringDelay; // Reset the number of frames to delay shooting again
	global.gunBlood -= bloodUsedPerShot;
	recoil = 4;
	
	ScreenShake(2, 10);
	
	audio_sound_pitch(snShot, choose(0.8, 1.0, 1.2));
	audio_play_sound(snShot, 5, false);
	
	// Create the bullet in the Bullets layer
	with (instance_create_layer(x, y, "Bullets", oBullet))
	{
		// Because of the WITH statement, everything in here is referring to the bullet
		// (except other, that's the gun)
		spd = 15;
		direction = other.image_angle + random_range(-3, 3); // Give the bullets some spread.
		image_angle = direction;
	}
	
	with (oPlayer)
	{
		gunKickX = lengthdir_x(1.5, other.image_angle - 180);
		gunKickY = lengthdir_y(1, other.image_angle - 180);
	}
}

// Set the recoil location. Use lengthdir_x/y because it's ~4 pixels at a diagonal
x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

// Flip the gun over if it's pointed to the left
if (image_angle > 90 && image_angle < 270)
	image_yscale = -1;
else
	image_yscale = 1;

