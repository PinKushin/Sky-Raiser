///movestate()


///horizontal movement
if !disablehormov{
   if right || left {
      hspd += hspddir * acc;
   
      if hspd > spd {hspd = spd;}
      if hspd < -spd {hspd = -spd;}
   
      //create dust
      if !instance_exists (owalkdust) {
         instance_create(x, y - 8, owalkdust);
      }
      
      //create step sound
      if !audio_is_playing(astep) && image_index >=2 && image_index < 3 || !audio_is_playing(astep) && image_index >= 6 && image_index < 7 {
         audio_play_sound(astep,1,false);
      }
   }else{
      hspd = 0;
      }
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
   
   grav(0.5)
   if disablehormov {script_execute(enablehormov)}
   heldtime = 0;
   ///control jump sprite
   sprite_index = splayerjump;
   image_speed = 0;
   image_index = (vspd > 0);
   
   if hspd !=0 {
      image_xscale = sign(hspd);
   }
   
   ///destroy walking dust
   if instance_exists(owalkdust) {
      with owalkdust { instance_destroy() }
   }
   
   ///fly
   if jump {
      prevhspd = hspddir * hspd; //make positive
      state = flystate;
   }
   
}else{ ///player on the ground
      vspd = 0;
      ///jump
      if jumprelease && heldtime <= room_speed / 2 { ///hold time check
         vspd = jumpheight;
         audio_play_sound(ajump, 5, false);
         
         ///create dust
         repeat (irandom_range(4, 7)) {
            instance_create (x, y + 16, ojumpdust)
            }
      }else if jumpheld && hspd == 0 {
            heldtime += 1;
            if heldtime >= room_speed / 2 { ///hold time check
                ///animate the crouch
                sprite_index = splayerheavyjump;
                image_speed = 0.2;
                disablehormov = 1;
                
                if image_index >= 3 {
                   image_index = 3;
                   image_speed = 0;
                } 
            }
      }else if jumprelease && hspd == 0 && heldtime >= room_speed / 2 { ///hold time check
            ///heavy jump
            image_speed = 0.75;
            vspd = jumpheight * 1.5;
            
            ///create dust
            repeat (irandom_range(6, 10)) {
                   var dust = instance_create (x, y + 16, ojumpdust);
                   dust.speed = random_range(4, 8);
            }
      }
      
      ///control walking sprite
      if hspd == 0 && !jumpheld {
         spriteanimate(splayeridle, 0.1);
      }else if !jumpheld {
            spriteanimate(splayerwalk, 0.2);
      }
}

if hspd != 0 {heldtime = 0;}

///move
move(osolidpar);

///still need to fix moonwalk
