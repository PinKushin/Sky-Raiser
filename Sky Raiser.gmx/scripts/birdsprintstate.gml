///sprintstate()
statetext = "bird sprint state";

if left || right {
   hspd += hspddir * acc;
   
   if hspd >= (spd * 1.5) {hspd = spd * 1.4}
   if hspd <= -(spd * 1.5) {hspd = -(spd * 1.4)}
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
}
///horizontal move
horsprintmove(osolidpar);
