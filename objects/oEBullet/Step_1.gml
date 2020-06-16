/// @description Move the bullet, then run the collision

// Change the bullet's location
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if (place_meeting(x, y, oWall) && image_index != 0)
{
	// Back out the collision so it shows as colliding with the edge of the wall
	while (place_meeting(x, y, oWall))
	{
		x -= lengthdir_x(1, direction);
		y -= lengthdir_y(1, direction);
	}
	spd = 0;
	instance_change(oHitSpark, true);
// instance_destroy();
}
	
