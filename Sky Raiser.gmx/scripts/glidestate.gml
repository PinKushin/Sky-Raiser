///glidestate()

///falling
grav(0.1);

///horizontal movement
if right || left {
   hspd = hspddir * spd;
   
   if hspd > spd{hspd = spd;}
   if hspd < -spd{hspd = -spd;}
}else{
      hspd = 0;
}

if jump {state = flystate;}

///on ground
grounded();

///control sprite
spriteanimate(0);

///move
move(osolidpar);
