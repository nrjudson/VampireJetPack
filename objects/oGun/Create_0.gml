/// @description Insert description here
// You can write your code in this editor

initFiringDelay = 45;
firingDelay = 0; // Timer for how many frames between bullets
recoil = 0;      // Timer for how far the gun is moving

controllerAngle = 0;

// Use blood for ammo
//global.gunBlood;
bloodUsedPerShot = 50;
maxBlood = 500;
//maxBlood = 100;
//ammo = 100;

if (global.hasGun == false)
	instance_destroy();
