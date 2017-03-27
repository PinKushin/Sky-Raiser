///hurtstate()
statetext = "hurt state";

image_blend = c_red;
grav(pgrav);

if alarm[HURT] <= 0 {
   image_blend = c_white;
   state = movestate;
}

///death
if oplayerstats.hp <=0 {
   oplayerstats.hp = 0;
   with oplayer {
        instance_destroy();
   }
   game_restart();
}

///move
move(osolidpar);
