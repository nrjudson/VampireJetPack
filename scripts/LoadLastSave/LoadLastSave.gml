


if (!file_exists(SAVEFILE))
{
	// Save file doesn't exist, just start a new game
	SlideTransition(TRANS_MODE.NEXT);
}
else
{
	var file = file_text_open_read(SAVEFILE);
	var room_target = file_text_read_real(file);
	global.kills = file_text_read_real(file);
	global.hasGun = file_text_read_real(file);
	global.gunBlood = file_text_read_real(file);
	global.deaths = file_text_read_real(file);
	global.hasJetpack = file_text_read_real(file);
	global.killsThisRoom = 0;
	file_text_close(file);
	SlideTransition(TRANS_MODE.GOTO, room_target );
}