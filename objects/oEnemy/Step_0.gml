vsp = vsp + grv;

// Don't walk off edges
// place_meeting: if we're not colliding with a box under us where we're about to move...
if (grounded && afraidOfHeights && !place_meeting(x+hsp, y+1, oWall))
{
	hsp = -hsp; // Turn the enemy around
}

// Horizontal collision
if (place_meeting(x+hsp, y, oWall))
{
	// Move over one pixel at a time until we're touching the wall
	while (!place_meeting(x+sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = -hsp; // Flip the enemy around, rather than stopping him, when he hits a wall.
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

if (!place_meeting(x, y+1, oWall)) // If player is in the air
{
	grounded = false;
	sprite_index = sEnemyA;
	image_speed = 0;
	if (sign(vsp) > 0) 
		image_index = 1; // Falling
	else 
		image_index = 0; // Jumping
}
else // Player is on the ground
{
	grounded = true;
	image_speed = 1;
	if (hsp == 0)
		sprite_index = sEnemy; // Standing
	else
		sprite_index = sEnemyR; // Running
}


if (sign(hsp) != 0) // If we're moving
	image_xscale = sign(hsp) * size; // Flip player image left or right accordingly
image_yscale = size;
	

