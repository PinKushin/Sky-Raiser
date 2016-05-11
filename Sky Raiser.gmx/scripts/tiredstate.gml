///tiredstate
hspd = 0;

if alarm [TIRED] <= 0 {
   state = movestate;
}

grav (pgrav)
///control sprite
spriteanimate(splayeridle, 0.1);

move(osolidpar);


