///getinput()
//player control
right = keyboard_check(ord ("D"));
left = keyboard_check(ord ("A"));
down = keyboard_check(ord ("S"));
up = keyboard_check(vk_space);
jump = keyboard_check_pressed(vk_space);
jumprelease = keyboard_check_released(vk_space);
sprint = keyboard_check(vk_shift);
fly = keyboard_check_pressed(ord("F"))

hspddir = right - left;
vspddir = down - up;
