/// @description 

//gunSprite = layer_sprite_get_id("TitleAssets", "gGun");

endText[0] = "Lynden Times, June 6, 1966."//+ string(global.kills) + " people.";
endText[1] = "TOTAL ANNIHILATION AT SAINT MARY'S MENTAL HOSPITAL";
endText[2] = "Esteemed mental hospital now a bullet-ridden warzone after inmate goes on rampage.";
endText[3] = "Fredrick Hesberger, 36, the escaped inmate, armed and highly dangerous...";
endText[4] = "...went on a rampage and murdered " + string(global.kills) + " staff and other inamates...";
endText[5] = "...after finding one of the security guard's guns in the courtyard.";
endText[6] = "Fredrick, who's room was full of bloody scribbles of a \"Vorpeth\" demon king and...";
endText[7] = "\"opening a river of blood thus to begin Judgement Day\"...";
endText[8] = "After discovering the gun, Jimmy promptly went about shooting everyone,";
endText[9] = "including patients, staff, and the security team...";
endText[10] = "where he found a jetpack and was able to blast out of the tower,";
endText[11] = "presumably for dramatic effect.";
endText[12] = "\"The worst part is\", one survivor states, \"he would smile and eat people...";
endText[13] = "\"and rub his gun in blood and organs. Oh his laughter was awful.\"";
endText[14] = "One thing is for sure, no one is safe until this lunatic is captured.";
endText[15] = "..."
endText[16] = "You died " + string(global.deaths) + " times, and killed " + string(global.kills);
endText[17] = "You monster.";

spd = 0.3;
letters = 0;
currentLine = 0;
length = string_length(endText[currentLine]);
text = "";