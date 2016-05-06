///flystate()

///control sprite
spriteanimate(splayerfly, 0.3);

///vertical movement previous code was vspd = -2;

///flutter effect
if image_index >= 0 && image_index < 1 {
   vspd = -4;
}else if image_index >= 1 && image_index < 2 {
      vspd = 0;
}else if image_index >=2 && image_index != 0 {
      vspd = 1;
}


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

///move
move(osolidpar);
