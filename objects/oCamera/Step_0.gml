/// @description Update camera

// Update destination
if (instance_exists(follow)) // follow is an object, probably oPlayer
{
	xTo = follow.x;
	yTo = follow.y;
	
	if ((follow).object_index == oPDead)
	{
		// hyper focus on player dead
		x = xTo;
		y = yTo;
	}
}

// Update actual position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

// Clamp the value to the edges of the room (so you don't see outside the room)
// Buffered the room edges so we don't shake outside the room
x = clamp(x, view_w_half+buff, room_width - view_w_half-buff); 
y = clamp(y, view_h_half+buff, room_height - view_h_half-buff);

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));

camera_set_view_pos(cam, x-view_w_half, y-view_h_half);

if (room != rMenu && room != rEnding)
{
	if (mountainLayer)
	{
		layer_x(mountainLayer, x/2); // The second value should be between 0 and 1 * x
	}
	if (treesLayer)
	{
		layer_x(treesLayer, x/6);
	}
}