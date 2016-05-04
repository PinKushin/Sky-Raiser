///flystate()

///vertical movement
vspd = -2;

if jumprelease {state = glidestate;}

///horizontal movement
if right || left {
   if prevhspd !=0 {
      hspd = hspddir * prevhspd;
      
      if hspd > prevhspd {hspd = prevhspd;}
      if hspd < -prevhspd {hspd = -prevhspd;}
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
