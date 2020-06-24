if (global.killsThisRoom >= killsToUnlock)
{
	locked = false;
}


if (locked && !wallsSetUp)
{
	// Put up the walls
	//instance_place(x, y, oWall);
	instance_create_layer(x+16, y+16, "Wall", oWall);
	//instance_place(x, y+32, oWall);
	instance_create_layer(x+16, y+48, "Wall", oWall);
	wallsSetUp = true;
	return;
}
else if (!locked && wallsSetUp)
{
	// Take the walls down, remove object visibility
	if (place_meeting(x+16, y+16, oWall))
	{
		with (instance_place(x+16, y+16, oWall))
		{
			instance_destroy();
		}
	}
	if (place_meeting(x+16, y+48, oWall))
	{
		with (instance_place(x+16, y+48, oWall))
		{
			instance_destroy();
		}
	}
	visible = false;
	wallsSetUp = false;
}
