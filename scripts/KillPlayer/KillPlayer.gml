/// @description DIE!!

with (oGun)
	instance_destroy();
	
instance_change(oPDead, true);

// Take the direction from the enemy to the player
direction = point_direction(other.x, other.y, x, y);

// Move/ bump us up
hsp = lengthdir_x(6, direction);
vsp = lengthdir_y(4, direction) - 2;

// Make sure sprite is pointing the right direction
if (sign(hsp) != 0) 
	image_xscale = sign(hsp);

global.kills -= global.killsThisRoom;
global.killsThisRoom = 0;