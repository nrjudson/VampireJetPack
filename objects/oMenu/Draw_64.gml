/// @description Draw Menu

draw_set_font(fMenu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++)
{
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i)
	{
		txt = string_insert("> ", txt, 0);
		var col = c_white;
	}
	else
	{
		var col = c_gray;	
	}
	var xx = menu_x;
	var yy = menu_y - (menu_item_height * (i * 1.5));
	draw_set_color(c_black);
	
	draw_text(xx-offset, yy, txt);
	draw_text(xx+offset, yy, txt);
	draw_text(xx, yy+offset, txt);
	draw_text(xx, yy-offset, txt);
	
	draw_set_color(col);
	draw_text(xx, yy, txt);
}

// Draw black outlines of title
DrawSetText(c_black, fTitle, fa_left, fa_top);
draw_text(103,66,"Vampire Jetpack");
DrawSetText(c_black, fTitle, fa_left, fa_top);
draw_text(111,66,"Vampire Jetpack");
DrawSetText(c_black, fTitle, fa_left, fa_top);
draw_text(107,70,"Vampire Jetpack");
DrawSetText(c_black, fTitle, fa_left, fa_top);
draw_text(107,62,"Vampire Jetpack");

// Draw title in white
DrawSetText(c_white, fTitle, fa_left, fa_top);
draw_text(107,66,"Vampire Jetpack");

draw_set_color(c_black);
draw_rectangle(gui_width, gui_height-200, gui_width+900, gui_height, false);