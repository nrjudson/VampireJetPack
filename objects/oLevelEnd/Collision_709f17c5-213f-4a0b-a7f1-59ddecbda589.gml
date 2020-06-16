/// @description Move to next room

with (oPlayer)
{
	if (has_control)
	{
		has_control = false;
		SlideTransition(TRANS_MODE.GOTO, other.target);
	}
}