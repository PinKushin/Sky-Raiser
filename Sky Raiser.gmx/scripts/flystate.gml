///flystate()
///grav = 0;
if !place_meeting(x, y + 1, osolidpar){
   if down || up && oplayerstats.stamina > flycost {
        vspd += vspddir * acc;
        
        if vspd > spd {vspd = spd;}
        if vspd < - spd {vspd = -spd;}
   }else{
         vspd = 0;
   }
   
   if right || left {
      hspd += hspddir * acc;
      
      if hspd > spd {hspd = spd;}
      if hspd < - spd {hspd = -spd;}
   }else{
         hspd = 0;
   }
}
if place_meeting(x, y + 1, osolidpar) {
   state = movestate;
}

///animate sprite
if hspd != 0 {
   image_xscale = sign(hspd);
}

///move
move(osolidpar);
