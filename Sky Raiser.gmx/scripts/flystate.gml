///flystate()

///vertical movement
vspd = -2;
if jumprelease {state = glidestate;}

///horizontal movement
if right || left {
   if prevspd !=0 {
      hspd = hspddir * prevspd;
      
      if hspd > prevspd {hspd = prevspd;}
      if hspd < -prevspd {hspd = -prevspd;}
   }else{
         hspd += hspddir * acc
         
         if hspd > spd {hspd = spd;}
         if hspd < -spd {hspd = -spd;}
   }
   
   
}else{
      hspd = 0;
}

///control sprite
spriteanimate(splayerwalk, 0.3);

///move
move(osolidpar);
