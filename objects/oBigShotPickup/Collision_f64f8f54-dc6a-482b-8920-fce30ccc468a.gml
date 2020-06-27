if (visible)
{
	// Equip the gun
	global.hasBigShot = true;
	//instance_create_layer(oPlayer.x, oPlayer.y, "Jetpack", oGun);
	audio_sound_pitch(snShot, 0.4);
	audio_play_sound(snShot, 5, false);
	instance_destroy();
}