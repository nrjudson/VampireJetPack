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

// Fire a super shot
if ((mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb))
	&& global.gunBlood >= bloodUsedPerShot && firingDelay <= 0 && global.hasBigShot)
{
	firingDelay = initFiringDelay; // Reset the number of frames to delay shooting again
	global.gunBlood -= bloodUsedPerShot;
	recoil = 4;
	ScreenShake(4, 10);
	audio_sound_pitch(snShot, choose(0.4, 0.5, 0.6));
	audio_play_sound(snShot, 5, false);
	
	repeat(6)
	{
		// Create the big shots in the Bullets layer
		with (instance_create_layer(x, y, "Bullets", oBloodBigShot))
		{
			spd = 18;
			direction = other.image_angle + random_range(-13, 13);;
			image_angle = direction;
		}
	}
	
	with (oPlayer)
	{
		gunKickX = lengthdir_x(10, other.image_angle - 180);
		gunKickY = lengthdir_y(10, other.image_angle - 180);
	}
}
// Fire a regular shot
else if ((mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb))
	&& global.gunBlood >= bloodUsedPerShot && firingDelay <= 0 )
{
	// BLOOD SHOT ATTACK
	firingDelay = initFiringDelay; // Reset the number of frames to delay shooting again
	global.gunBlood -= bloodUsedPerShot;
	recoil = 2;
	
	ScreenShake(2, 10);
	
	audio_sound_pitch(snShot, choose(0.8, 1.0, 1.2));
	audio_play_sound(snShot, 5, false);
	
	// Create the bullet in the Bullets layer
	with (instance_create_layer(x, y, "Bullets", oBullet))
	{
		// Because of the WITH statement, everything in here is referring to the bullet
		// (except other, that's the gun)
		spd = 15;
		direction = other.image_angle;// + random_range(-3, 3); // Give the bullets some spread.
		image_angle = direction;
	}
	
	with (oPlayer)
	{
		gunKickX = lengthdir_x(1, other.image_angle - 180);
		gunKickY = lengthdir_y(1, other.image_angle - 180);
	}
}
// Claw attack on shift (always) or click (if out of blood)
else if (firingDelay <= 0 
		&& (keyboard_check(vk_shift) || gamepad_button_check(0, gp_shoulderr)
			|| (mouse_check_button(mb_left) && global.gunBlood < bloodUsedPerShot)
			|| (mouse_check_button(mb_right) && global.gunBlood < bloodUsedPerFrameJetpack)
			|| (gamepad_button_check(0, gp_shoulderrb) && global.gunBlood < bloodUsedPerShot)
			|| (gamepad_button_check(0, gp_shoulderlb) && global.gunBlood < bloodUsedPerFrameJetpack)))
{
	// Again, this is CLAW ATTACK
	firingDelay = initSlashDelay; // Reset the number of frames to delay shooting again
	
	ScreenShake(4, 6);
	
	audio_sound_pitch(snDeath, choose(1.2, 1.35, 1.5));
	audio_play_sound(snDeath, 5, false);
	
	// Create the bullet in the Bullets layer
	with (instance_create_layer(x, y, "Bullets", oSlash))
	{
		direction = other.image_angle;
		// Set the claw attack to stay in front of the player's current direction
		offsetX = lengthdir_x(32, direction);
		offsetY = lengthdir_y(32, direction);
		x += offsetX;
		y += offsetY;
		image_angle = direction;
		image_xscale *= -1; // I drew the sprite backwards
		var multiplier = choose(-1, 1);
		image_yscale *= multiplier;
	}
}

// JETPACK
if (global.hasJetpack && (mouse_check_button(mb_right) || gamepad_button_check(0, gp_shoulderlb))
	&& global.gunBlood >= bloodUsedPerFrameJetpack)
{
	global.gunBlood -= bloodUsedPerFrameJetpack;
	with (oPlayer)
	{
		gunKickX = lengthdir_x(1, other.image_angle - 180);
		gunKickY = lengthdir_y(1, other.image_angle - 180);
	}
	// Create the bullet in the Bullets layer
	with (instance_create_layer(x, y, "Bullets", oBloodBullet))
	{
		// Because of the WITH statement, everything in here is referring to the bullet
		// (except other, that's the gun)
		spd = 15;
		direction = other.image_angle + random_range(-3, 3); // Give the bullets some spread.
		image_angle = direction;
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

