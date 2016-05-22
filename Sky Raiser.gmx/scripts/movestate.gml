///movestate()
var hj = jumpheight * 1.5;

//statetext = "move state";

image_blend = c_white;

///horizontal movement
if !disablehormov {
   if right || left {
      hspd += hspddir * acc;
   
      if hspd > spd {hspd = spd;}
      if hspd < -spd {hspd = -spd;}
   
      //create dust
      if !instance_exists (owalkdust) {
         instance_create(x, y - 8, owalkdust);
      }
      
      //create step sound
      if !audio_is_playing(astep) && image_index >= 2 && image_index < 3 && jumpstate != "heavyjump" || 
         !audio_is_playing(astep) && image_index >= 6 && image_index < 7 && jumpstate != "heavyjump" {
         audio_emitter_pitch(psfx, random_range(0.8, 1));
         audio_emitter_gain(psfx, 1);
         audio_play_sound_on(psfx, astep, false, 6);
      }
   }else{
      hspd = 0;
   }
}

///sprint
if sprint  && place_meeting (x, y + 1, osolidpar) {
   state = sprintstate;
}else{
      regenstamina();
}

///player is in the air
if !place_meeting(x, y + 1, osolidpar) {
   
   grav(pgrav)
   if disablehormov {script_execute(enablehormov)}
   heldtime = 0;
   
   ///control jump sprite
   sprite_index = splayerjump;
   image_speed = 0;
   image_index = (vspd > 0);
   
   ///down attack
   if action {
      prevhspd = hspd;
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
   
}else{ ///player on the ground
      ///set vspd
      vspd = 0;
      ///jump
      if jumprelease && heldtime <= room_speed / 2 { ///hold time check
         statetext = "lightjump"
         jumpstate = "lightjump"
         vspd = jumpheight;
         audio_emitter_pitch(psfx, random_range(0.9, 1));
         audio_emitter_gain(psfx, 0.1);
         audio_play_sound_on(psfx, ajump, false, 6);
         
         ///create dust
         repeat (irandom_range(4, 7)) {
            instance_create (x, y + 16, ojumpdust)
            }
      }else if jumpheld && hspd == 0 {
            heldtime += 1;
            if heldtime >= room_speed / 2 { ///hold time check
                ///animate the crouch
                statetext = "heavyjump"
                jumpstate = "heavyjump"
                disablehormov = 1;
            }
      }else if jumprelease && hspd == 0 && heldtime >= room_speed / 2 { ///hold time check
            ///heavy jump
            vspd = jumpheight * 2;
            
            ///create dust
            repeat (irandom_range(6, 10)) {
                   var dust = instance_create (x, y + 16, ojumpdust);
                   dust.speed = random_range(4, 8);
            }
      }
      
      ///action button
      if action && jumpstate = "lightjump" && !jumprelease {
            sprite_index = splayerlightgroundattack;
            image_index = 0;
            state = lightgroundattack
      }

      ///control walking sprite
      if hspd == 0 && !jumpheld && !action {
         spriteanimate(splayeridle, 1);
      }else if !jumpheld && !action {
            spriteanimate(splayerwalk, 0.2);
      }
      
      if jumpheld {
         if hspd != 0 {
            sprite_index = splayerwalk;
            image_speed = 0.2;
         }else if hspd == 0 {
               sprite_index = splayeridle;
         }
      }
      
      ///moonwalk fix
      if hspd != 0 {
         image_xscale = sign(hspd);
      }
}

if hspd != 0 {heldtime = 0;}

///landing sound
if place_meeting (x, y + vspd + 1, osolidpar) && vspd > 0 {
    audio_emitter_pitch (psfx, random_range (0.8, 1.2));
    audio_emitter_gain (psfx, 1);
    audio_play_sound_on (psfx, astep, false, 6);
}

///move
move(osolidpar);
