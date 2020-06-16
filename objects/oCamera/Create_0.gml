/// @description Setup camera

cam = view_camera[0];

follow = oPlayer; // since we only have 1 player, this is ok. Otherwise we'd need an instance instead of the object.

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

xTo = xstart; // Where the camera is moving to
yTo = ystart;

// Screen shake
shake_length = 0; // 60 frames, 1 second worth of shaking
shake_magnitude = 0; // how far the screen shakes, basically the starting value that's permanent
shake_remain = 0; // This decreases until it hits 0
buff = 32; // buffer for the screen shake- keeps the camera inside this buffer so when the shake happens we don't see outside the room

mountainLayer = layer_get_id("Mountains");
treesLayer = layer_get_id("Trees");
