///batattack
if instance_exists(oplayer) {
    var dis = point_distance(x, y, oplayer.x, oplayer.y);
    var dir = point_direction(x, y, oplayer.x, oplayer.y);
    
    statetext = "attack"
    
    if dis > attackrange || lineofsight(oplayer) == false  {
       state = batchase;
    }else {
          ///attack
          hspd = lengthdir_x(spd * 2, dir);
          vspd = lengthdir_y(spd * 2, dir);
          
          if oplayer.state == hurtstate {
             alarm[ATTACK] = room_speed;
             state = batchase;
          }      
    }
}

move(osolidpar);
