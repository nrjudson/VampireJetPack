/// @description auto-save

// Overwrite old save
if (file_exists(SAVEFILE))
{
	file_delete(SAVEFILE);
}

// Create new save
var file;
file = file_text_open_write(SAVEFILE);
file_text_write_real(file, room);
file_text_write_real(file, global.kills);
file_text_write_real(file, global.hasGun);
file_text_write_real(file, global.gunBlood);
file_text_write_real(file, global.deaths);
file_text_write_real(file, global.hasJetpack);
file_text_write_real(file, global.hasBigShot);
global.killsThisRoom = 0;
file_text_close(file);

