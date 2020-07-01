if (done == 0)
{
	vsp = vsp + grv;

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
		if (vsp > 0) // It's done when it hits the floor
		{
			done = 1;
			image_index = 1; // Show the laying dead sprite
		}
		// Move over one pixel at a time until we're touching the wall
		while (!place_meeting(x, y+sign(vsp), oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}

// Doing a bunch of stuff that rely's on the player below...
if (!instance_exists(oPlayer))
{
	return;
}

var player = instance_find(oPlayer, 0);

// If the player is close to this guy he can eat him
if (point_in_circle(player.x, player.y, x, y, 64) && !beingEaten && !eaten && !player.eating)
{
	nearby = true;
	if (keyboard_check_pressed(ord("S"))
		|| gamepad_axis_value(0, gp_axislv) > 0.4
		|| gamepad_button_check_pressed(0, gp_face2))
	{
		beingEaten = true;		
		player.eating = true;
		
		// if we were just in the air, then play a sfx now that we landed
		audio_sound_pitch(snDeath, choose(0.4, 0.6, 0.8)); // adjust pitch randomly slightly
		audio_play_sound(snDeath, 10, false);
	}
}
else
{
	nearby = false;
}
if (beingEaten)
{
	beingEatenFrames = max(0, beingEatenFrames-1);
	if (beingEatenFrames == 0)
	{
		beingEaten = false;
		eaten = true;
		player.eating = false;
		sprite_index = sEnemyDEaten;
		global.gunBlood = min(global.maxBlood, global.gunBlood+100);
		audio_sound_pitch(snDeath, 1.0);
	}
}