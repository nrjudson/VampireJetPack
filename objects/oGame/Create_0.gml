/// @description 

#macro RES_W 1024
#macro RES_H 768
//#macro DICEROLL irandom(6) // cool save for later
#macro SAVEFILE "Save.sav"

display_set_gui_size(RES_W, RES_H);

global.kills = 0;
global.killsThisRoom = 0;
killTextScale = 1;
global.deaths = 0;

global.hasGun = false;
global.hasJetpack = false;

global.gunBlood = 400;
global.maxBlood = 500;

// PARTICLES
// Init
global.pSystem = part_system_create();
global.p1 = part_type_create();
part_type_shape(global.p1, pt_shape_ring);
//part_type_sprite(global.p1, sPlayerR, true, true, true);
part_type_life(global.p1, room_speed, room_speed*2); // 1-2 seconds
part_type_color3(global.p1, c_red, c_yellow, c_gray);
part_type_blend(global.p1, true);
part_type_direction(global.p1, 20, 330, 5, 2);
//part_type_speed(global.p1, 
part_type_gravity(global.p1, .2, 270);

global.pe1 = part_emitter_create(global.pSystem);


// MUSIC
//audio_sound_pitch(supertramp_rudy, choose(0.5, /*1.0,*/ 1.5));
var pitch = choose(0.6, 0.85, 1.0, 1.15, 1.3, 1.5);
audio_sound_pitch(supertramp_rudy, pitch);
audio_play_sound(supertramp_rudy, 1000, true);
//alarm[0] = 30*((2*60) + 15); // 6:24 song (1 second break)
alarm[0] = 30*((6*60) + 28); // 6:24 song (4 second break)