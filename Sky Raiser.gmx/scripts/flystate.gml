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

///animate sprite
if hspd != 0 {
   image_xscale = sign(hspd);
}

///move
move(osolidpar);
