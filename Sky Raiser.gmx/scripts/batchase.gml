///batchase()
if instance_exists(oplayer) {
    var dis = point_distance(x, y, oplayer.x, oplayer.y);
    var dir = point_direction(x, y, oplayer.x, oplayer.y);
    
    statetext = "chase"
    
    if dis <= sightrange && dis > attackrange {
       hspd = lengthdir_x(spd, dir);
       vspd = lengthdir_y(spd, dir);
       spriteanimate(sbatfly, 1);
    }else if dis <= attackrange {
          hspd = 0;
          vspd = 0;
          state = batattack;
    }else {
          hspd = 0;
          vspd = 0;
          state = batidle;
    }
}

move(osolidpar);
