///sprintstate()
if alarm[TIRED] <= 0 {
   hspd += hspddir * acc;
   if hspd > (spd * 1.5) {hspd = spd * 1.5}
   if hspd < -(spd * 1.5) {hspd = -(spd * 1.5)}
}else{
     state = movestate;
     hspd = 0;
}

///player is in the air
if !place_meeting(x, y + 1, osolidpar){
   vspd += grav;
   
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
      oplayerstats.stamina -= 2;
}

if !sprint {state = movestate;}

if oplayerstats.stamina <= 0 {
   oplayerstats.stamina = 0
   state = movestate;
}

///control sprite
if hspd != 0 {
   image_xscale = sign(hspd);
}

///move
move(osolidpar);
