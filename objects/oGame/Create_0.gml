/// @description 

#macro RES_W 1024
#macro RES_H 768
//#macro DICEROLL irandom(6) // cool save for later

display_set_gui_size(RES_W, RES_H);

global.kills = 0;
global.killsThisRoom = 0;
killTextScale = 1;

global.hasGun = false;

global.gunBlood = 400;


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