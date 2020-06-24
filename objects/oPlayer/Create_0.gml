/// @description Constructor

hsp = 0;
vsp = 0;
grv = 0.3;
walksp = .5;
maxsp = 5;
maxAirSpeed = 12;
//groundResistSp = 0.47;
airResistSp = 0.16;

controller = 1; // Controller use on or off. Gets turned off if the keyboard is used.

has_control = true;

canJump = 0;

gunKickX = 0;
gunKickY = 0;

eating = false;

audio_sound_pitch(snShot, 0.8);