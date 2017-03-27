////downairattack
statetext = "down air attack";

hspd = prevhspd;
attacking = true;

grav(pgrav);

spriteanimate(splayerdownairattack, 0);
move(osolidpar);
grounded();

if jump {
   state = flystate;
}
