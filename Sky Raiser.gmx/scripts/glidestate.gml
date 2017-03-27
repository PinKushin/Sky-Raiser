///glidestate()
statetext = "glide state";

vspd = 2;

regenstamina();

///horizontal movement
if right || left {
   hspd = hspddir * spd;
   
   if hspd > spd {hspd = spd;}
   if hspd < -spd {hspd = -spd;}
}else{
      hspd = 0;
}

///go to fly state
if jump && oplayerstats.stamina >= jumpcost {
   oplayerstats.stamina -= jumpcost;
   state = flystate;
}


///down air attack
if action {
      state = downairattack;
}

///on ground
grounded();

///control sprite
spriteanimate(splayerglide, 0);

///move
move(osolidpar);
