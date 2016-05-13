///batchase()
if instance_exists(oplayer) {
    var dis = point_distance(x, y, oplayer.x, oplayer.y);
    var dir = point_direction(x, y, oplayer.x, oplayer.y);
    
    statetext = "chase"
    
    if dis <= sightrange && dis > attackrange && lineofsight(oplayer) == true && alarm[ATTACK] <= 0 {
       hspd = lengthdir_x(spd, dir);
       vspd = lengthdir_y(spd, dir);
       spriteanimate(sbatfly, 0.5);
    }else if dis <= attackrange && lineofsight(oplayer) == true && alarm[ATTACK] <= 0 {
          state = batattack;
    }else if x != startx && y != starty {
          //go back to original position
          dir = point_direction(x, y, startx, starty);
          dis = point_distance(x, y, startx, starty);
          if dis > spd {
             hspd = lengthdir_x(spd, dir);
             vspd = lengthdir_y(spd, dir);
          }else{
                hspd = 0;
                vspd = 0;
                state = batidle;
          }
    }
}

move(osolidpar);
