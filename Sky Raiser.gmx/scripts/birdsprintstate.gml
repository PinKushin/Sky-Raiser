///sprintstate()
statetext = "bird sprint state";
sprite_index = splayerfly;
image_speed = 0;
image_index = 5;

if left || right {
   hspd += hspddir * acc;
   
   if hspd >= (spd * 1.5) {hspd = spd * 1.5}
   if hspd <= -(spd * 1.5) {hspd = -(spd * 1.5)}
}else {
      hspd = 0;
}


///go back to movestate
if !sprint {state = movestate;}

/// vertical move
if place_meeting (x, y + 32, osolidpar) && sprint {
   while !place_meeting (x, y + 32, osolidpar) {
        y += 1;
    }
   y -= 1;
}else if !place_meeting(x, y + 32, osolidpar) {
       y += 1;
}

if hspd != 0 {
   image_xscale = (sign(hspd));
}
///horizontal move
horsprintmove(osolidpar);
