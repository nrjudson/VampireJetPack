/// @description Draw the blood meter

draw_self();

// Draw the blood bar (how much ammo you have basically)
// To use this hp bar, must standardize blood to /100
if (instance_exists(oGun))
{
	//var gun = instance_find(oGun, 0);
	var divisor = global.maxBlood / 100;
	var blood100 = global.gunBlood / divisor;
	draw_healthbar(x-20, y-28, x+20, y-22, blood100, c_black, c_red, c_red, 0, true, false);
}

// DEBUG DRAW
//DrawSetText(c_white, fMenu, fa_center, fa_top);
//draw_text(x, y, string(gamepad_axis_value(0, gp_axislv)));
