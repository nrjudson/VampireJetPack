/// @description 

hsp = 3;
vsp = -4;
grv = 0.3;
done = 0;

nearby = false;
beingEaten = false;
beingEatenFrames = 30;
eaten = false;

image_speed = 0;

ScreenShake(8, 25);

audio_play_sound(snDeath, 10, false);