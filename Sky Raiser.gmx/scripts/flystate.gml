///flystate()

///control sprite
spriteanimate(splayerfly, 0.3);

///vertical movement previous code was vspd = -2;

///flutter effect
if image_index >= 0 && image_index < 1 {
   vspd = -4;
   ///consume stamina
   oplayerstats.stamina -= 1;
}else if image_index >= 1 && image_index < 2 {
      vspd = 0;
}else if image_index >=2 && image_index != 0 {
      vspd = 1;
}

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

///keep stamina from going negative and switch to tired state
if oplayerstats.stamina <= 0 {
   oplayerstats.stamina = 0;
   alarm[TIRED] = vultime;
   state = tiredstate;
}

///down air attack
if action {
      state = downairattack;
}

///change states
if jumprelease {state = movestate;}
if jumpheld && down {state = glidestate;}

///move
move(osolidpar);
