/// @description Every frame

if (eating)
{
	sprite_index = sPlayerEat;
	return;
}

if (has_control)
{
	// Get player input
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);

	if (key_left || key_right || key_jump)
		controller = 0;
	
	if (abs(gamepad_axis_value(0, gp_axislh)) > 0.05)
	{
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(0, gp_shoulderlb))
	{
		controller = 1;
		key_jump = 1;
	}
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}


// Calculate movement
var move = key_right - key_left;

var inTheAir = !place_meeting(x, y+1, oWall);

if (inTheAir)
{
	//if (move != 0)
	//{
	//	var oldHsp = hsp;
	//	hsp = move*walksp;
		
	//	if (sign(gunKickX) == sign(move))
	//	{
	//		hsp = oldHsp + 
	//	}
	//}
	
	if (move == 0)
	{
		hsp = hsp + gunKickX;
	}
	else if (abs(hsp) >= abs(move*walksp) && sign(hsp) != sign(move))
	{
		// If we are moving >= walkspeed and move is in the opposite direction
		// Disregard hsp and apply walksp to other direction
		// Allows player to change directions quickly in midair without jetpack
		hsp = move*walksp + gunKickX;
	}
	else if (abs(hsp) >= abs(move*walksp))
	{
		// If we're moving >= walkspeed and move is in the same direction
		// Don't apply move
		hsp = hsp + gunKickX;

	}
	else if (abs(hsp) < abs(move*walksp) && sign(hsp) == sign(move))
	{
		// If we're moving slower than our walkspeed and move is in the same direction
		// Adjust our midair speed to match that of walksp
		hsp = move*walksp + gunKickX;
	}
	else if (abs(hsp) >= abs(move*walksp) && sign(hsp) == sign(move))
	{
		// If we're moving slower than our walkspeed and move in is the opposite direction
		hsp = hsp + (move*walksp) + gunKickX;
	}
	else
	{
		hsp = hsp + move*walksp + gunKickX;
	}
	
	// Set max hsp in either direction
	if (hsp > 10) hsp = 10;
	if (hsp < -10) hsp = -10;
}	
else
{
	hsp = (move * walksp) + gunKickX;
}
gunKickX = 0;


vsp = (vsp + grv) + gunKickY;
vsp = max(-10, vsp); // Set maximum jetpack upward speed
gunKickY = 0;

// Jumping
canJump -= 1;
if (canJump > 0 && key_jump)
{
	vsp = -8;
	canJump = 0;
}

// Horizontal collision
if (place_meeting(x+hsp, y, oWall))
{
	// Move over one pixel at a time until we're touching the wall
	while (!place_meeting(x+sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// Vertical collision
if (place_meeting(x, y+vsp, oWall))
{
	// Move over one pixel at a time until we're touching the wall
	while (!place_meeting(x, y+sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;


///////////////
// Animation
///////////////

var aimSide = sign(mouse_x - x); // +1 for mouse on the right of the player, -1 otherwise
if (aimSide != 0)
{
	image_xscale = aimSide;
}

if (inTheAir) // If player is in the air
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0) 
		image_index = 1; // Falling
	else 
		image_index = 0; // Jumping
}
else // Player is on the ground
{
	canJump = 10; // 10 frames left to jump
	if (sprite_index == sPlayerA) 
	{
		// if we were just in the air, then play a sfx now that we landed
		audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2)); // adjust pitch randomly slightly
		audio_play_sound(snLanding, 10, false);
		// Make some dust appear under the player when they land
		repeat(5)
		{
			with (instance_create_layer(x, bbox_bottom, "Bullets", oDust))
			{
				vsp = 0;
			}
		}
	}
	image_speed = 1;
	if (hsp == 0)
		sprite_index = sPlayer; // Standing
	else
	{
		sprite_index = sPlayerR; // Running
		if (aimSide != sign(hsp))
			sprite_index = sPlayerRb; // Run backwards
	}
}

// Removed when we started using strafe animations
//if (sign(hsp) != 0) // If we're moving
//	image_xscale = sign(hsp); // Flip player image left or right accordingly
	

