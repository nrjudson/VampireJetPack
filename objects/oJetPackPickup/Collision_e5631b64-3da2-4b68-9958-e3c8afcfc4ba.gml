if (global.killsThisRoom == 1)
{
	// Equip the gun
	global.hasJetpack = true;
	//instance_create_layer(oPlayer.x, oPlayer.y, "Jetpack", oGun);
	audio_sound_pitch(snShot, 0.6);
	audio_play_sound(snShot, 5, false);
	instance_destroy();
}