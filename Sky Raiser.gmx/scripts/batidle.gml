///batidle()
if instance_exists(oplayer) {

    var dis = point_distance(x, y, oplayer.x, oplayer.y);
    spriteanimate(sbatidle, 0);
    statetext = "idle"
    
    if dis <= sightrange && lineofsight(oplayer) == true {
       state = batchase;
    }
}
