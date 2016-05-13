////downairattack
statetext = "down air attack";

jumpstate = "lightjump";
hspd = prevhspd;

grav(pgrav);

spriteanimate(splayerdownairattack, 0);
move(osolidpar);
grounded();

if jump {
   state = flystate;
}
