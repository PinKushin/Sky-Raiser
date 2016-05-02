///scrYCollisionFall()

if place_meeting (x,y + grav, oSolid){
   while !place_meeting (x, y+1 , oSolid){
      y += 0.1 ;
      }
   grav = 0 ;
   y += 0 ;
   grounded = 1;
}
else{ grounded = 0 }

if grounded == 0{           //if player is airborne
   if held {
      if grav < maxGravHeld{
         grav += 0.5 ; 
         }
   if grav > maxGravHeld{grav = maxGravHeld}
   }

   else{
      if grav < maxGrav{
         grav += 0.5 ; 
         }
   if grav > maxGrav{grav = maxGrav}
   }
}

y += grav + (vsp * flightHeight)
