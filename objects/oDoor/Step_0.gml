if (global.killsThisRoom >= killsToUnlock)
{
	locked = false;
}


if (locked && !wallsSetUp)
{
	// Put up the walls
	//instance_place(x, y, oWall);
	instance_create_layer(x, y, "Wall", oWall);
	//instance_place(x, y+32, oWall);
	instance_create_layer(x, y+32, "Wall", oWall);
	wallsSetUp = true;
	return;
}
else if (!locked && wallsSetUp)
{
	// Take the walls down, remove object visibility
	if (place_meeting(x, y, oWall))
	{
		with (instance_place(x, y, oWall))
		{
			instance_destroy();
		}
	}
	if (place_meeting(x, y+32, oWall))
	{
		with (instance_place(x, y+32, oWall))
		{
			instance_destroy();
		}
	}
	visible = false;
	wallsSetUp = false;
}
