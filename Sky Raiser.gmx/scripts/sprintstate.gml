///sprintstate()
statetext = "sprint state";
sprite_index = splayerglide;
if left || right {
   hspd += hspddir * acc;
   if hspd > (spd * 1.5) {hspd = spd * 1.4}
   if hspd < -(spd * 1.5) {hspd = -(spd * 1.4)}
}else {
      hspd = 0;
}

///player is in the air
if !place_meeting(x, y + 1, osolidpar) {
   grav(pgrav)
   ///control jump sprite
   state = glidestate;
   if jump { 
      prevspd = hspddir * hspd; //make positive
      state = flystate;
   }
   
   ///control jump height
   if jumprelease && vspd < (jumpheight / 2) {
      vspd = (jumpheight / 2);
   }
}else{ ///player on the ground
      
      ///jump
      if jump {
         jumpstate = "lightjump"
         vspd = jumpheight;
         audio_play_sound(ajump, 5, false);
         repeat (irandom_range(4, 7)) {
            instance_create (x, y + 16, ojumpdust)
            }
      }
      
      ///control walking sprite
      if hspd == 0 {
         image_index = 0;
      }else {
            image_index = 1;
            image_xscale = sign(hspd);
            oplayerstats.stamina -= .5;
      }
}

///go back to movestate
if !sprint {state = movestate;}

///stamina regen
if oplayerstats.stamina <= 0 {
   oplayerstats.stamina = 0
   alarm[TIRED] = vultime;
   state = tiredstate;
}

///move
move(osolidpar);
