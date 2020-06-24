/// @description Every frame

if (eating)
{
	sprite_index = sPlayerEat;
	image_speed = 1;
	return;
}

if (has_control)
{
	// Get player input
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
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
var move = key_right - key_left; // -1 or 1
//if (key_down) 
//	move = 0; // ... or 0

var inTheAir = !place_meeting(x, y+1, oWall);

var movingFasterThanRunning = true;
	if (abs(hsp) <= maxsp)
		movingFasterThanRunning = false;

// In the air vertical movement (after getting jetpack)
//if (global.hasJetpack && inTheAir)
if (inTheAir)
{
	// Process keyboard movements
	if (key_down)
	{
		// Pressing down always means slow down
		// And if we're close enough to 0, just go to zero
		if (abs(hsp) - walksp <= 0)
			hsp = 0;
		else
			hsp += walksp * -sign(hsp);
	}
	else if (move == 0)
	{
		// Very slow air resistance stop
		if (abs(hsp) - airResistSp <= 0)
			hsp = 0;
		else
			hsp += airResistSp * -sign(hsp);
	}
	else if (sign(hsp) != move)
	{
		// We're trying to move in the opposite direction
		// Slow down mid-air- don't change direction instantly
		hsp += (walksp*move);
	}
	else if (sign(hsp) == move && !movingFasterThanRunning)
	{
		// We're slower than our max running speed
		// And we're trying to go faster in the same direction
		hsp += (walksp*move);
		if (hsp > maxsp)
			hsp = maxsp;
		else if (hsp < -maxsp)
			hsp = -maxsp;
	}
	
	//Now add the gunkick
	hsp += gunKickX;
}
// On the ground
else
{
	if (move == 0 || key_down)
	{
		// Slow down code. Same as above for in the air.
		if (abs(hsp) - walksp <= 0)
			hsp = 0;
		else
			hsp += walksp * -sign(hsp);
	}
	else
	{
		// Move in a direction faster (if not up to running speed)
		hsp += (walksp * move);
		if (!movingFasterThanRunning && hsp > maxsp)
		{
			hsp = maxsp;
		}
		else if (!movingFasterThanRunning && hsp < -maxsp)
		{
			hsp = -maxsp;
		}
		// Slow down to max ground speed
		if (abs(hsp) - maxsp > 0)
			hsp = sign(hsp) * maxsp;
		//else
		//	hsp += walksp * -sign(hsp); // Ground-induced drag
	}
	
	hsp += gunKickX;
	
	//hsp = (move * walksp) + gunKickX;
}
// Set max hsp in either direction
if (hsp > maxAirSpeed) 
	hsp = maxAirSpeed;
if (hsp < -maxAirSpeed) 
	hsp = -maxAirSpeed;
gunKickX = 0;

// Vertical movement. (Much simpler)
vsp = (vsp + grv) + gunKickY;
// Set max vsp in either direction
if (vsp > maxAirSpeed) 
	vsp = maxAirSpeed;
if (vsp < -maxAirSpeed) 
	vsp = -maxAirSpeed;
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
		// Player WAS just in the air, so he's landing
		// Make some dust appear under the player when they land
		var dustBits = 5;
		if (key_down)
		{
			// if we were just in the air, then play a sfx now that we landed
			audio_sound_pitch(snLanding, choose(0.4, 0.5, 0.6)); // adjust pitch randomly slightly
			audio_play_sound(snLanding, 10, false);
			dustBits = 25;
		}
		else
		{
			// if we were just in the air, then play a sfx now that we landed
			audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2)); // adjust pitch randomly slightly
			audio_play_sound(snLanding, 10, false);
			dustBits = 5;
		}
		repeat(dustBits)
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

