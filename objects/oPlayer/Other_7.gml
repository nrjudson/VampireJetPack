/// @description footsteps

// Running sounds and puffs of dust
if (sprite_index == sPlayerR) 
{
	audio_play_sound(choose(snFoot1, snFoot2, snFoot3, snFoot4), 10, false);
	
	with (instance_create_layer(x, bbox_bottom, "Bullets", oDust))
	{
		vsp = 0;
		hsp = sign(other.hsp);
	}
}