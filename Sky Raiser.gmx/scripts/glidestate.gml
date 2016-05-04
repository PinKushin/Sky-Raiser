///glidestate()
gravmodifier = 0.08
grav(gravmodifier);



///falling
if up {
}else{timetomodifygrav += 1 /room_speed  //to gradually increase gravity the longer you are in the are
}

///horizontal movement
if right || left {
   hspd = hspddir * spd;
   
   if hspd > spd {hspd = spd;}
   if hspd < -spd {hspd = -spd;}
}else{
      hspd = 0;
}

if jump {vspd = (jumpheight / 2) ; state = flystate(vspd);}

///on ground
grounded();

///control sprite
spriteanimate(splayerwalk, 0.3);

///move
move(osolidpar);
