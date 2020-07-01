/// @description Control menu


// Ease the items from the right side of the screen
menu_x += (menu_x_target - menu_x) / menu_speed;

stick_control_cooldown--;
if (stick_control_cooldown < 0) 
	stick_control_cooldown = 0;

// Keyboard controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
		|| gamepad_button_check_pressed(0, gp_padu)
		|| (gamepad_axis_value(0, gp_axislv) < -0.2 && stick_control_cooldown == 0))
	{
		stick_control_cooldown = stick_control_initial_cooldown;
		menu_cursor++;
		if (menu_cursor >= menu_items)
			menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))
		|| gamepad_button_check_pressed(0, gp_padd)
		|| (gamepad_axis_value(0, gp_axislv) > 0.2 && stick_control_cooldown == 0))
	{
		stick_control_cooldown = stick_control_initial_cooldown;
		menu_cursor--;
		if (menu_cursor < 0)
			menu_cursor = menu_items-1;
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) 
		|| gamepad_button_check_pressed(0, gp_face1))
	{
		menu_x_target = gui_width + 200; // send the menu away
		menu_committed = menu_cursor;
		ScreenShake(4, 30);
		menu_control = false;
		audio_play_sound(snDeath, 10, false);
	}
	
	// Capture mouse input
	var mouse_y_gui = device_mouse_y_to_gui(0);
	var mouse_x_gui = device_mouse_x_to_gui(0);
	if (mouse_y_gui < menu_y && mouse_y_gui > menu_top && mouse_x_gui > menu_x - 200)
	{
		// We're between the top and bottom of the menu
		// "div" provides a whole-number result of dividing
		menu_cursor = (menu_y - mouse_y_gui) div (menu_item_height * 1.5);
		
		if (mouse_check_button_pressed(mb_left))
		{
			menu_x_target = gui_width + 200; // send the menu away
			menu_committed = menu_cursor;
			ScreenShake(4, 30);
			menu_control = false;
			audio_play_sound(snDeath, 10, false);
		}
	}
}

if (menu_x > gui_width+150 && menu_committed != -1)
{
	switch(menu_committed)
	{
		case 2: SlideTransition(TRANS_MODE.NEXT); break;
		case 1: 
		{
			LoadLastSave();
		}
		break;
		case 0: game_end(); break;
	}
}