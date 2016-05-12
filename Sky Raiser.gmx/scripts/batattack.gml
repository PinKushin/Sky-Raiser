///batattack
if instance_exists(oplayer) {
    var dis = point_distance(x, y, oplayer.x, oplayer.y);
    var dir = point_direction(x, y, oplayer.x, oplayer.y);
    
    statetext = "attack"
    
    if dis > attackrange {
       state = batchase;
    }else {
          ///attack
          if alarm[ATTACK] <= 0 {
             hspd = lengthdir_x(spd * 2, dir);
             vspd = lengthdir_y(spd * 2, dir);
             alarm[ATTACK] = room_speed;
          }else {
                hspd = 0;
                vspd = 0;
          }
    }
}

move(osolidpar);
