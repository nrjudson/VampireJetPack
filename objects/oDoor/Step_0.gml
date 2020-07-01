if (global.killsThisRoom >= killsToUnlock)
{
	locked = false;
}


if (locked && !wallsSetUp)
{
	// Put up the walls
	wall1 = instance_create_layer(x+16, y+16, "Wall", oWall);
	wall2 = instance_create_layer(x+16, y+48, "Wall", oWall);
	wallsSetUp = true;
	return;
}
else if (!locked && wallsSetUp)
{
	// Take the walls down, remove object visibility
	with (wall1)
		instance_destroy();
	with (wall2)
		instance_destroy();
	visible = false;
	wallsSetUp = false;
}
