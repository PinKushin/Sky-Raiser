///lightgroundattack()

sprite_index = splayerlightgroundattack 
if image_index >=0{image_speed = 0.3; hspd += 2}
if image_index >=3{image_speed = 0.5; hspd += 10}
if image_index >=4{image_speed = 0.5; hspd += 20}

if image_index = image_number - 1 {
state = movestate
}
