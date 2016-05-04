///sprintstate()

hspd += hspddir * acc;
if hspd > (spd * 1.5) {hspd = spd * 1.5}
if hspd < -(spd * 1.5) {hspd = -(spd * 1.5)}

///player is in the air
if !place_meeting(x, y + 1, osolidpar) {
   grav(1);
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
         vspd = -20;
         
         audio_play_sound(ajump, 5, false);
      }
      oplayerstats.stamina -= 2;
}

if !sprint {state = movestate;}

if oplayerstats.stamina <= 0 {
   oplayerstats.stamina = 0
   state = tiredstate;
}

///control sprite
spriteanimate(0);

///move
move(osolidpar);
