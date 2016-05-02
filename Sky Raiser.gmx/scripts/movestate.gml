///movestate()

///sprint vulnerability
if oplayerstats.stamina < 1 {
   alarm[TIRED] = room_speed
}

///horizontal movement
if right && alarm[TIRED] <= 0 || left && alarm[TIRED] <= 0 {
   hspd += hspddir * acc;
   
   if hspd > spd{hspd = spd;}
   if hspd < -spd{hspd = -spd;}
}else{
      hspd = 0;
}

///sprint
if sprint && oplayerstats.stamina >= 2 && place_meeting (x, y + 1, osolidpar) {
   state = sprintstate;
}else{
      oplayerstats.stamina += 1;
      if oplayerstats.stamina > oplayerstats.maxstamina{
         oplayerstats.stamina = oplayerstats.maxstamina;
      } 
}

///player is in the air
if !place_meeting(x, y + 1, osolidpar){
   vspd += grav;
   
   if jump {
      state = flystate;
   }
   
   ///control jump height
   if jumprelease && vspd < -6 {
      vspd = -6;
   }
}else{ ///player on the ground
      vspd = 0;
      ///jump
      if jump && alarm[TIRED] <= 0 {
         vspd = -12;
         audio_play_sound(ajump, 5, false);
      }
}


///control sprite
if hspd != 0 {
   image_xscale = sign(hspd);
}

move(osolidpar);

