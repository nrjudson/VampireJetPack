// Destroy both bullets on impact
with (other)
	instance_destroy();
instance_change(oHitSpark, true);