///jumperidle()

if instance_exists (oplayer) {
    var dis = point_distance (x, y, oplayer.x, oplayer.y);
    var dir = point_direction(x, y, oplayer.x,oplayer.y);
    var ledgeleft = !position_meeting (bbox_left - 1, bbox_bottom + 1, osolidpar)
    var wallatleft = position_meeting (bbox_left - 1, y, osolidpar)
    var ledgeright = !position_meeting (bbox_right + 1, bbox_bottom + 1, osolidpar)
    var wallatright = position_meeting (bbox_right + 1, y, osolidpar)
    
    if ledgeleft && dis > sight || wallatleft {
        statetext = "ledgeleft"
        hspd = spd; 
    }else if ledgeright && dis > sight || wallatright {
        statetext = "ledgeright"
        hspd = -spd;
    }
    if dis < sight && alarm[ATTACK] <=0 {
        //make sure we face the player
        if oplayer.x != x {
            image_xscale = sign (oplayer.x - x);
        }
        hspd += lengthdir_x(spd/5, dir );
    }else{
        image_xscale = (sign(hspd));
    }
}
if !place_meeting(x, y + 1, osolidpar) {
    vspd += 1;
}else{
    vspd = 0;
}

move(osolidpar);

