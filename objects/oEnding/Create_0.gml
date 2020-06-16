/// @description 

gunSprite = layer_sprite_get_id("TitleAssets", "gGun");

// If we have the gun and killed at least one dude...
if (global.hasGun && global.kills > 0)
{
	endText[0] = "And on this day our hero had slain " + string(global.kills) + " people.";
	if (global.kills == 1)
		endText[0] = "And on this day our hero killed a guy for no reason.";
	endText[1] = "But some of those people had guns too, so...";
	endText[2] = "He was probably saving the world or something.";
	endText[3] = "Regardless, he was arrested 2 days later and spent the rest of his life in prison.";
	endText[4] = "The defense team tried to argue that the sexy recoil effects and hit flashes were to blame\nbut to no avail.";
	endText[5] = "The park ranger would later state she was \"not angry, just disappointed\"";
	endText[6] = "The end.";
}
else 
{
	layer_sprite_destroy(gunSprite);
	endText[0] = "And on this day our hero had a wonderful, serene walk through the national park\nand didn't murder anyone.";
	endText[1] = "They reported a discarded firearm to the local authorities\nand were thanked profusely for assisting in ongoing crimes.";
	endText[2] = "And all it took was behavior that outside of a videogame context\nnone would hope is completely normal.";
	endText[3] = "Who would have thought?";
	endText[4] = "The end.";
}

spd = 0.5;
letters = 0;
currentLine = 0;
length = string_length(endText[currentLine]);
text = "";