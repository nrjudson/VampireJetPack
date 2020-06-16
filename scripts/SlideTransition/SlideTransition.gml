/// @desc SlideTransition(mode, targetRoom)
/// @arg Mode sets transition mode between next, restart, and goto.
/// @arg targetRoom sets target room to go to when using goto mode.

with(oTransition)
{
	mode = argument[0];
	if (argument_count > 1)
		target = argument[1];
	
}