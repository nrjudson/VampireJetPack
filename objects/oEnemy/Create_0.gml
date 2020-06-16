if (hasWeapon)
{
	myGun = instance_create_layer(x, y, "Gun", oEGun);
	with (myGun)
	{
		owner = other.id;
	}
}
else
{
	myGun = noone;
}