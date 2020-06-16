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

// If the player is close to this guy he can eat him
if (point_in_circle(oPlayer.x, oPlayer.y, x, y, 64) && !beingEaten && !eaten)// && !instance_exists(oText))
{
	nearby = true;
	if (keyboard_check_pressed(ord("S")))
	{
		beingEaten = true;
		var player = instance_find(oPlayer, 0);
		player.eating = true;
		//player.sprite_index = sPlayerEat;
		
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
		var player = instance_find(oPlayer, 0);
		//player.sprite_index = sPlayer;
		player.eating = false;
		sprite_index = sEnemyDEaten;
		global.gunBlood = min(global.maxBlood, global.gunBlood+100);
		audio_sound_pitch(snDeath, 1.0);
	}
}