///getinput()

//player control
right = keyboard_check(ord ("D"));
left = keyboard_check(ord ("A"));
down = keyboard_check(ord ("S"));
up = keyboard_check(ord("W"));
jump = keyboard_check_pressed(vk_space);


jumprelease = keyboard_check_released(vk_space);
jumpheld = keyboard_check(vk_space);
sprint = keyboard_check(vk_shift);
action = keyboard_check_pressed(ord("J"));

vspddir = down - up;
hspddir = right - left;
