///glidestate()
vspd = 2;

regenstamina()

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
spriteanimate(splayerwalk, 0.3);

///move
move(osolidpar);
