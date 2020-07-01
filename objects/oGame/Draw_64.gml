/// @description Draw score

if (room != rMenu && instance_exists(oPlayer) && global.kills > 0)
{
	killTextScale = max(killTextScale * 0.95, 1)
	
	// Draw shadow
	DrawSetText(c_black, fMenu, fa_right, fa_top);
	draw_text_transformed(RES_W - 8, 12, string(global.kills) + " Sick kills", killTextScale, killTextScale, 0);
	// Draw white text
	draw_set_color(c_white);
	draw_text_transformed(RES_W - 10, 12, string(global.kills) + " Sick kills", killTextScale, killTextScale, 0);
	
	// Draw shadow
	DrawSetText(c_black, fMenu, fa_right, fa_top);
	draw_text_transformed(RES_W - 8, 36, string(global.deaths) + " Unholy deaths", killTextScale, killTextScale, 0);
	// Draw white text
	draw_set_color(c_white);
	draw_text_transformed(RES_W - 10, 36, string(global.deaths) + " Unholy deaths", killTextScale, killTextScale, 0);

	//// Draw shadow
	//DrawSetText(c_black, fMenu, fa_right, fa_top);
	//draw_text_transformed(RES_W - 8, 60, string(global.killsThisRoom) + " Kills this room", killTextScale, killTextScale, 0);
	//// Draw white text
	//draw_set_color(c_white);
	//draw_text_transformed(RES_W - 10, 60, string(global.killsThisRoom) + " Kills This Room", killTextScale, killTextScale, 0);

}