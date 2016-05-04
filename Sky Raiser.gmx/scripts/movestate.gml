///movestate()

///horizontal movement
if right || left {
   hspd += hspddir * acc;
   
   if hspd > spd{hspd = spd;}
   if hspd < -spd{hspd = -spd;}
   ///control sprite
   spriteanimate(splayerwalk, 0.3);
}else{
      hspd = 0;
      spriteanimate(splayeridle, 0.1);
}

///sprint
if sprint && oplayerstats.stamina >= 2 && place_meeting (x, y + 1, osolidpar) {
   state = sprintstate;
}else{
      oplayerstats.stamina += 1;
      if oplayerstats.stamina > oplayerstats.maxstamina {
         oplayerstats.stamina = oplayerstats.maxstamina;
      } 
}

///player is in the air
if !place_meeting(x, y + 1, osolidpar) {
   vspd += 1
   
   if jump {
      prevspd = hspddir * hspd; //make positive
      state = flystate;
   }
   
   ///control jump height
   if jumprelease && vspd < -6 {
      vspd = -6;
   }
}else{ ///player on the ground
      vspd = 0;
      ///jump
      if jump {
         vspd = -10;
         audio_play_sound(ajump, 5, false);
      }
}

///move
move(osolidpar);

