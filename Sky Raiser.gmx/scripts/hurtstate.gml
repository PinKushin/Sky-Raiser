///hurtstate()
image_blend = c_red;

if alarm[HURT] <= 0 {
   image_blend = c_white;
   state = movestate;
}
if oplayerstats.hp <=0 {
   oplayerstats.hp = 0;
   with oplayer {
        instance_destroy();
   }
   game_restart();
}
