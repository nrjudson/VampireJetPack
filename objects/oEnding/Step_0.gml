/// @description 

// move player toward center
layer_x("TitleAssets", min(layer_get_x("TitleAssets")+1, RES_W * 0.5 - 32));

// progress the text
letters += spd;
text = string_copy(endText[currentLine], 1, floor(letters));

// If the text completes a line and a key is pressed
if (letters >= length && (keyboard_check_pressed(vk_anykey) || mouse_check_button(mb_left)))
{
	// If it's the last line. Restart the game.
	if (currentLine+1 == array_length_1d(endText))	
	{
		SlideTransition(TRANS_MODE.RESTART);
	}
	// Otherwise, advance to the next line
	else
	{
		currentLine++;
		letters = 0;
		length = string_length(endText[currentLine]);
	}
}