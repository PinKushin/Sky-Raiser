///sprintstate()
statetext = "sprint state";

var sjump = jumpheight * 1.5;
var saccel = 360 / (room_speed * room_speed);

if left || right {
    
    ///horizontal movement physics
    if abs(hspd) < spd {
        hspd += hspddir * acc;
    }else if abs(hspd) >= spd && abs(hspd) <= mspd {
        hspd += hspddir * saccel;
    }
    
    ///movement cap
    if abs(hspd) > mspd {
        hspd = hspddir * mspd;
    }
    
    //dust creation
   if !instance_exists (owalkdust) {
      instance_create(x, y - 8, owalkdust);
   }
   
   //step audio creation
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
   grav(pgrav);
   
   ///destroy walking dust
   if instance_exists(owalkdust) {
     with owalkdust { instance_destroy() }
   }
   
   ///sprite control
   sprite_index = splayerheavyjump;
   image_speed = 0.3 ;
   if image_index < 6 {
        image_index = 6
   }
   
   if jump { 
      //flight switch
      prevspd = hspddir * hspd; //make positive
      state = flystate;
   }
   
   ///control jump height
   if jumprelease && vspd < (sjump / 2) {
      vspd = (sjump / 2);
   }
}else{ ///player on the ground
      vspd = 0;
      
      ///jump
      if jump {
         vspd = sjump;

         ///jump audio creation *to do*
         
         
         ///dust creation
         repeat (irandom_range(4, 7)) {
            instance_create (x, y + 16, ojumpdust)
         }
      }
      
      ///sprite control
      if hspd == 0 {
         spriteanimate(splayeridle, 0.1);
      }else{
            spriteanimate(splayerwalk, 0.4);
            
            //stamina reduction
            if global.iStamina == false {oplayerstats.stamina -= .5;}
      }
}

///landing audio
if place_meeting (x, y + vspd + 1, osolidpar) && vspd > 0 {
    audio_emitter_pitch (psfx, random_range (0.8, 1.2));
    audio_emitter_gain (psfx, 1);
    audio_play_sound_on (psfx, astep, false, 6);
}

///movestate switch
if !sprint {state = movestate;}

///tired state switch
if oplayerstats.stamina <= 0 {
   oplayerstats.stamina = 0
   alarm[TIRED] = vultime;
   state = tiredstate;
}

///move
move(osolidpar);
