/// @description Move the bullet, then run the collision

// Change the bullet's location
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

// Particles
////part_particles_create(global.pSystem, x, y, global.p1, 3);
//part_emitter_region(global.pSystem, global.pe1, x-20, y-20, x+20, y+20, ps_shape_ellipse, ps_distr_gaussian);
////part_emitter_burst(global.pSystem, global.pe1, global.p1, 3);
//part_emitter_stream(global.pSystem, global.pe1, global.p1, 3);

// Check for collision with pShootbale, then with oWall (below)
if (place_meeting(x, y, pShootable))
{
	with (instance_place(x, y, pShootable)) // in this case, other is the Enemy hit
	{
		hp -= 3;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}

if (place_meeting(x, y, oWall) && image_index != 0)
{
	
	spd = 0;
	instance_change(oBloodSpark, true); // Destroy the bullet and put a hit spark in this location	
	layer_add_instance("Tiles", id); // Put this on the tiles layer...
	depth += 1; // Plus one depth 
	
	// Back out the collision so it shows as colliding with the edge of the wall
	while (place_meeting(x, y, oWall))
	{
		x -= lengthdir_x(1, direction);
		y -= lengthdir_y(1, direction);
	}
}
	
