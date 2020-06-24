/// @description 

gunSprite = layer_sprite_get_id("TitleAssets", "gGun");

// If we have the gun and killed at least one dude...
if (global.hasGun && global.kills > 0)
{
	endText[0] = "Finally, Vorpeth, our Villain, is free."//+ string(global.kills) + " people.";
	if (global.kills == 1)
		endText[0] = "And on this day our hero killed a guy for no reason.";
	endText[1] = "Even though he drank (and used) the blood and bones of " + string(global.kills) + " Total Retribution, Inc. employees,";
	endText[2] = "He is still hungry.";
	endText[3] = "As he was... since time immemorial.";
	endText[4] = "The curse for accepting the jetpack, was the unending hunger.";
	endText[5] = "--- Or so he thought...";
	endText[6] = "Actually he's just a dude that just escaped from a mental asylum.";
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