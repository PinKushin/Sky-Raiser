///lightgroundattack()
image_speed = 0.55;
hspd += image_xscale * 0.5;
 

//fix wall sticking bug
if place_meeting(x + hspd, y, osolidpar) {
   state = movestate;
}

///move
move(osolidpar);
