///flystate()

///vertical movement
vspd = -2;
if jumprelease {state = glidestate;}

///horizontal movement
if right || left {
   hspd = hspddir * prevspd;
   
   if hspd > prevspd {hspd = prevspd;}
   if hspd < -prevspd {hspd = -prevspd;}
}else{
      hspd = 0;
}

///control sprite
spriteanimate(splayerwalk, 0.3);

///move
move(osolidpar);
