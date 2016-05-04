///tiredstate
if alarm [TIRED] <= 0 {
   alarm[TIRED] = room_speed;
}

///control sprite
spriteanimate(splayeridle, 0.1);


