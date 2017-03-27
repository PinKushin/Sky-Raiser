///movestate()

statetext = "move state";

image_blend = c_white;


if right || left {
   
    ///horizontal movement physics
    if abs(hspd) < spd {
        hspd += hspddir * acc;
    }
    
    ///movement cap
    if abs(hspd) >= spd {
        hspd = hspddir * spd;
    }

   //create dust
   if !instance_exists (owalkdust) {
      instance_create(x, y - 8, owalkdust);
   }
   
   //create step sound
   if !audio_is_playing(astep) && image_index >= 2 && image_index < 3  || 
      !audio_is_playing(astep) && image_index >= 6 && image_index < 7  {
      audio_emitter_pitch(psfx, random_range(0.8, 1));
      audio_emitter_gain(psfx, 1);
      audio_play_sound_on(psfx, astep, false, 6);
   }
   
}else 
    if floor(abs(hspd)) != 0 {
    hspd -= sign(hspd) * decel;
    
}else 
    if floor(abs(hspd)) == 0 {
    hspd = 0;
}


///player is in the air
if !place_meeting(x, y + 1, osolidpar) {
   
   grav(pgrav)
   ///control jump sprite
   sprite_index = splayerjump;
   image_speed = 0;
   image_index = (vspd > 0);
   
   ///down attack
   if action {
      prevhspd = hspddir * hspd
      state = downairattack;
   }
   
   if hspd !=0 {
      image_xscale = sign(hspd);
   }
   
   ///destroy walking dust
   if instance_exists(owalkdust) {
      with owalkdust { instance_destroy() }
   }
   
   ///fly
   if jump && oplayerstats.stamina >= jumpcost {
      oplayerstats.stamina -= jumpcost;
      prevhspd = hspddir * hspd; //make positive
      state = flystate;
   }
   
   ///control jump height
   if jumprelease && vspd < (jumpheight / 2) {
      vspd = (jumpheight / 2);
   }
   
}else{ ///player on the ground
      ///set vspd
      vspd = 0;
      ///jump
      if jump {
         vspd = jumpheight;
         
         ///create dust
         repeat (irandom_range(4, 7)) {
            instance_create (x, y + 16, ojumpdust)
         }
      }
      
      ///sprint switch
      if sprint && oplayerstats.stamina >= 2{
            state = sprintstate;
      }else{
            regenstamina();
      }
      
      ///action button
      if action {
            sprite_index = splayerlightgroundattack;
            image_index = 0;
            state = lightgroundattack
      }

      ///control walking sprite
      if hspd == 0 && !action {
         spriteanimate(splayeridle, 0.1);
      }else if !action {
            spriteanimate(splayerwalk, 0.2);
      }
      
      ///moonwalk fix
      if hspd != 0 {
         image_xscale = sign(hspd);
      }
}

///landing sound
if place_meeting (x, y + vspd + 1, osolidpar) && vspd > 0 {
    audio_emitter_pitch (psfx, random_range (0.8, 1.2));
    audio_emitter_gain (psfx, 1);
    audio_play_sound_on (psfx, astep, false, 6);
}

///move
move(osolidpar);
