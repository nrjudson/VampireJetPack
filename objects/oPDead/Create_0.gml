/// @description Insert description here
// You can write your code in this editor

hsp = 3;
vsp = -4;
grv = 0.2; // Reduced a tiny bit
done = 0;

image_speed = 0;
image_index = 0;

ScreenShake(8, 25);
audio_play_sound(snDeath, 10, false);

game_set_speed(30, gamespeed_fps); // Cheapest hackiest slowmo effect

with (oCamera) 
	follow = other.id;
	
