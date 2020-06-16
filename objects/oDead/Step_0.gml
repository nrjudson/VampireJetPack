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

