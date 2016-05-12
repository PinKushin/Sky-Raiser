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
else if jumpheld && !down {state = flystate;}


///down air attack
if action {
      state = downairattack;
}
///transition to fall if no buttons are held
if !jumpheld && !down && jumpstate != "heavyjump"  {state = movestate;}

///on ground
grounded();

///control sprite
spriteanimate(splayerglide, 0);

///move
move(osolidpar);
