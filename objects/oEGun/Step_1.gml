//if (!instance_exists(owner))
//	instance_destroy();
//	return;

x = owner.x;
y = owner.y + 10;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

if (instance_exists(oPlayer))
{
	if (oPlayer.x < x)
	{
		image_yscale = -image_yscale;
	}
	if (point_distance(oPlayer.x, oPlayer.y, x, y) < 600)
	{
		image_angle = point_direction(x, y, oPlayer.x, oPlayer.y);
		countdown--;
		if (countdown < 0)
		{
			// Only shoot if the line of sight is clear to the player
			if (!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, false))
			{
				countdown = countdownrate;
			
				audio_sound_pitch(snShot, choose(0.8, 1.0, 1.2));
				audio_play_sound(snShot, 5, false);
	
				// Create the bullet in the Bullets layer
				with (instance_create_layer(x, y, "Bullets", oEBullet))
				{
					// Because of the WITH statement, everything in here is referring to the bullet
					// (except other, that's the gun)
					spd = 6;
					direction = other.image_angle + random_range(-3, 3); // Give the bullets some spread.
					image_angle = direction;
				}
			}
		}
	}
}