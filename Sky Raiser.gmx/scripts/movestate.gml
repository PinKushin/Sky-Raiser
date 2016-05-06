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
   if jumpstate == "lightjump" {
       sprite_index = splayerjump;
       image_speed = 0;
       image_index = (vspd > 0);
   }else if jumpstate == "heavyjump" {
         
         sprite_index = splayerheavyjump;
         if image_index > image_number - 1 {
            heavyjumprotations ++; //used to slow speed of rotation down as the player does more rotations, neat idea
            if heavyjumprotations = 0 {
               grav(-1)
            }
            else if heavyjumprotations = 1{
               grav(-2)
            }
            else if heavyjumprotations = 2{
               grav(-3)
            }
            else if heavyjumprotations = 3{
               grav(-(vspd))
            }
            else if heavyjumprotations = 4{ 
               state = glidestate 
               }
            
            image_index = 6; 
         }
         if heavyjumprotations = 3 grav(-vspd)
         if heavyjumprotations = 0 {
            image_speed = 1;
            vspd += 0.02                         
         }
         else if heavyjumprotations == 1 {
            image_speed -= 0.005;                       
         }
         else if heavyjumprotations == 2 {
            image_speed -= 0.020
                                  
         }
         else if heavyjumprotations == 3 {
            image_speed = 0.20
                    
         }
         else if heavyjumprotations == 4 {
            image_speed = 0.50
         
         }

         
   }
   
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
      ///switch back to lightjump to fix falling animation
      if image_index > 6 {
         jumpstate = "lightjump"
         if heavyjumprotations != 0{ //so that the twirls aren't messed up
            heavyjumprotations = 0
         }
      }
      ///set vspd
      vspd = 0;
      ///jump
      if jumprelease && heldtime <= room_speed / 2 { ///hold time check
         jumpstate = "lightjump"
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
                jumpstate = "heavyjump"
                sprite_index = splayerheavyjump;
                image_speed = 0.2;
                disablehormov = 1;
                
                ///stop the crouch animation
                if image_index >= 3 {
                   image_index = 3;
                   image_speed = 0;
                } 
            }
      }else if jumprelease && hspd == 0 && heldtime >= room_speed / 2 { ///hold time check
            ///heavy jump
            vspd = jumpheight * 1.5;
            
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
         spriteanimate(splayeridle_iter3, 0.1);
      }else if !jumpheld && !action {
            spriteanimate(splayerwalk_iter3, 0.2);
      }
      
      ///moonwalk fix
      if hspd != 0 {
         image_xscale = sign(hspd);
      }
}


if hspd != 0 {heldtime = 0;}

///move
move(osolidpar);
