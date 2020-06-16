/// @description Insert description here
// You can write your code in this editor

// Draw sprite normally
draw_self(); // Just like calling super.draw(); 

// Draw white
if (flash > 0)
{
	flash--;
	shader_set(shWhite);
	draw_self(); 
	shader_reset();
}