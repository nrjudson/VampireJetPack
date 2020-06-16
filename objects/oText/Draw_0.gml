/// @description 

var halfW = w * 0.5;

// draw the box
draw_set_color(c_black);
draw_set_alpha(0.5); // reduce transp.
draw_roundrect_ext(x-halfW-border, y-h-(border*2), x+halfW+border, y, 15, 15, false);

draw_sprite(sMarker, 0, x, y);

draw_set_alpha(1); // reset transp.

DrawSetText(c_white, fSign, fa_center, fa_top);
draw_text(x, y-h-border, text_current);